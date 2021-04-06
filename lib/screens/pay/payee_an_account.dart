import 'package:easymoney/screens/pay/payeeList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

enum SingingCharacter { lafayette }
SingingCharacter _character = SingingCharacter.lafayette;

class PayeeanAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Payee an account"),
        centerTitle: true,
        //automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_outlined),
              alignment: Alignment(-0.5, 0.0), // move icon a bit to the left
            );
          },
        ),
      ),
      body: Container(
        child: ListView(children: <Widget>[
          Container(
            height: 220,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0x10000000),
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: Offset(2.0, 2.0))
              ],
            ),
            margin: EdgeInsets.all(20),
            child: Padding(
                padding: EdgeInsets.all(5),
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        //controller:  TextEditingController(text: "Select Account"),
                        decoration: InputDecoration(
                          labelText: 'From',
                          hintText: "Select Account",
                          suffixIcon: Icon(Icons.keyboard_arrow_right),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        onTap: () {
                          pushNewScreen(context, screen: PayeeList());
                        },
                        readOnly: true,
                        //controller:  TextEditingController(text: "Add/select payye"),
                        decoration: InputDecoration(
                          labelText: 'To',
                          hintText: "Add/select payye",
                          suffixIcon: Icon(Icons.keyboard_arrow_right),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        hintText: "Enter amount",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            height: 130,
            padding: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0x10000000),
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: Offset(2.0, 2.0))
              ],
            ),
            margin: EdgeInsets.all(20),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'What sort of payment is this?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: RadioListTile<SingingCharacter>(
                        title: const Text('Thomas',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text('34547-1287-34'),
                        activeColor: Colors.blue,
                        value: SingingCharacter.lafayette,
                        groupValue: _character,
                        onChanged: ((SingingCharacter value) {
                          setState(() {
                            _character = value;
                          });
                        }),
                      ),
                    ),
                    Expanded(
                        child: Text('Change date',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ))),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue[800],
              padding: EdgeInsets.all(15),
              onPressed: () {
                // Respond to button press
              },
              child: Text('Review Payment'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue[800])),
            ),
          ),
          Container(
            height: 170,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0x10000000),
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: Offset(2.0, 2.0))
              ],
            ),
            child: ListView(children: [
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Important',
                  style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.radio_button_unchecked,
                  size: 14,
                ),
                title: Text(
                  'Future-date payment can\'t be subseqently changed in the app. You\'ll need to use online or Telephone Banking instead.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.radio_button_unchecked,
                  size: 14,
                ),
                title: Text(
                  'If you\'re Wealth customer , please call us.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
