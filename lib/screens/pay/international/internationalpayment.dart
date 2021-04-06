import 'package:easymoney/screens/pay/international/payeeList_international.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class InternationalpaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("International payment"),
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
            padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Text('choose the account you want to paymeny from'),
          ),
          Container(
            height: 180,
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
                      padding: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        readOnly: true,
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
                          pushNewScreen(context,
                              screen: PayeeListInternational());
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
                  ],
                )),
          ),
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text('Payment amount and exchange rate')),
          Container(
            height: 220,
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
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    readOnly: true,
                    //controller:  TextEditingController(text: "Select Account"),
                    decoration: InputDecoration(
                      labelText: 'You send',
                      suffixIcon: Icon(Icons.flag_outlined),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    readOnly: true,
                    //controller:  TextEditingController(text: "Add/select payye"),
                    decoration: InputDecoration(
                      labelText: 'Equivalent to',
                      suffixIcon: Icon(Icons.flag_outlined),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
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
        ]),
      ),
    );
  }
}
