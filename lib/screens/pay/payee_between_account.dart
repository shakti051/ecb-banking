import 'package:easymoney/screens/pay/payeeList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

int _radioValue = 0;

class PaybetweenAccount extends StatelessWidget {
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      switch (_radioValue) {
        case 0:
          print('now');
          break;
        case 1:
          print('date');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Transfer Money"),
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
          Padding(
            padding: EdgeInsets.fromLTRB(25, 20, 20, 0),
            child: Text(
              'Transfer money between your account',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            height: 300,
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
                        onTap: () {},
                        readOnly: true,
                        //controller: TextEditingController(text: "Select Account"),
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
                        onTap: () {},
                        readOnly: true,
                        // controller: TextEditingController(text: "Select Account"),
                        decoration: InputDecoration(
                          labelText: 'To',
                          hintText: "Add/select payye",
                          suffixIcon: Icon(Icons.keyboard_arrow_right),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Amount',
                            hintText: "Enter amount",
                            floatingLabelBehavior:
                                FloatingLabelBehavior.always),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Refrence',
                          hintText: "Enter refrence",
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  ],
                )),
          ),
          Container(
            height: 170,
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
                    'When eould you like to happen?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                        value: 0,
                        groupValue: _radioValue,
                        activeColor: Colors.blue[800],
                        onChanged: _handleRadioValueChange,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Select a date',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                        value: 1,
                        groupValue: _radioValue,
                        activeColor: Colors.blue[800],
                        onChanged: _handleRadioValueChange,
                      ),
                    ),
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
              child: Text('Confirm'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue[800])),
            ),
          ),
        ]),
      ),
    );
  }
}
