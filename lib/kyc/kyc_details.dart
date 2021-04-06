import 'package:easymoney/kyc/takeselfie.dart';
import 'package:easymoney/utils/network_util.dart';
import 'package:easymoney/widgets/alertBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class KYCDetails extends StatefulWidget {
  final String docName;
  final String docKey;

  KYCDetails({this.docName, this.docKey});

  @override
  _KYCDetailsState createState() => _KYCDetailsState();
}

class _KYCDetailsState extends State<KYCDetails> {
  DateTime selectedDate = DateTime.now();
  var _mSelectedDate = "Date of Birth";
  var _mNameController = TextEditingController();
  var _mNumberController = TextEditingController();
  var _fastNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _addressController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneController = TextEditingController();

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    var prefixName = Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(width: 0.5, color: Colors.grey),
        ),
      ),
      height: 45.0,
      margin: const EdgeInsets.only(right: 8.0),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
              value: _value,
              items: [
                DropdownMenuItem(child: Text("Mr"), value: 1),
                DropdownMenuItem(child: Text("Mrs"), value: 2),
                DropdownMenuItem(child: Text("Miss"), value: 3),
                DropdownMenuItem(child: Text("Ms"), value: 4),
                DropdownMenuItem(child: Text("Dr"), value: 5),
                DropdownMenuItem(child: Text("Prof"), value: 6),
                DropdownMenuItem(child: Text("Sir"), value: 7),
                DropdownMenuItem(child: Text("Master"), value: 8),
                DropdownMenuItem(child: Text("other"), value: 9)
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade50),
                    borderRadius: BorderRadius.circular(23),
                    color: Colors.white),
                child: ListView(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                            '* Make sure all the details are match with document ')),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.only(left: 15, right: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white),
                      child: TextFormField(
                        controller: _fastNameController,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus();
                        },
                        decoration: InputDecoration(
                            prefixIcon: prefixName,
                            hintText: 'First Name',
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.only(left: 15, right: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white),
                      child: TextFormField(
                        controller: _lastNameController,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus();
                        },
                        decoration: InputDecoration(
                            hintText: 'Last Name ', border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.only(left: 15, right: 10),
                      height: 100,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white),
                      child: TextFormField(
                        controller: _addressController,
                        maxLines: 3,
                        keyboardType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus();
                        },
                        decoration: InputDecoration(
                            hintText: 'Address', border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 8, right: 8),
                        padding: EdgeInsets.only(left: 15, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(23),
                            color: Colors.white),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              _mSelectedDate,
                            )),
                            Icon(Icons.calendar_today,
                                size: 20, color: Colors.black)
                          ],
                        ),
                      ),
                      onTap: () {
                        _selectDate();
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.only(left: 15, right: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white),
                      child: TextFormField(
                        controller: _mNumberController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                            hintText: 'Document Number',
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.only(left: 15, right: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white),
                      child: TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus();
                        },
                        decoration: InputDecoration(
                            hintText: 'Email', border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.only(left: 8, right: 8),
                      padding: EdgeInsets.only(left: 15, right: 10),
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.2)),
                          borderRadius: BorderRadius.circular(23),
                          color: Colors.white),
                      child: TextFormField(
                        controller: _phoneController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus();
                        },
                        decoration: InputDecoration(
                            hintText: 'Telephone', border: InputBorder.none),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(23),
                              color: Colors.blue),
                          child: FlatButton(
                            onPressed: () {
                              _doSubmit();
                            },
                            padding: EdgeInsets.all(0),
                            child: Text('Continue',
                                style: TextStyle(color: Colors.white)),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _selectDate() async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _mSelectedDate = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  void _doSubmit() async {
    if (_mSelectedDate != "Date of Birth") {
      if (_mNumberController.text.isNotEmpty) {
        if (_fastNameController.text.isNotEmpty) {
          if (_lastNameController.text.isNotEmpty) {
            if (_addressController.text.isNotEmpty) {
              if (_emailController.text.isNotEmpty) {
                if (_phoneController.text.isNotEmpty) {
                  try {
                    String token =
                        await FlutterSecureStorage().read(key: "_accessToken");
                    var headers = {
                      'Content-Type': 'application/x-www-form-urlencoded',
                      'Authorization': 'Bearer $token',
                    };
                    var bodyFields = {
                      'title': _value.toString(),
                      'dob': _mSelectedDate,
                      'documentno': _mNumberController.text,
                      'firtname': _fastNameController.text,
                      'lastname': _lastNameController.text,
                      'address': _addressController.text,
                      'email': _emailController.text,
                      'phone': _phoneController.text,
                    };
                    print(headers);
                    postreq('kyc/detail', headers, bodyFields, context)
                        .then((res) {
                      print(res);
                      if (res['statusCode'] == 200) {
                        pushNewScreen(context,
                            screen: TakeSelfie(
                              docsType: widget.docName,
                            ));
                      } else {
                        AlertBox(res['responce'], "error", context);
                      }
                    });
                  } catch (error) {
                    AlertBox(error, "error", context);
                  }
                }
              }
            }
          }
        }
      } //close
    }
  }
}

class ListItem {
  int value;
  String name;
  ListItem(this.value, this.name);
}
