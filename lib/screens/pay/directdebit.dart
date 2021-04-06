import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DirectDebit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Direct Debits"),
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
        color: Colors.grey[200],
        child: ListView(children: <Widget>[
          Container(
            height: 50,
            margin: EdgeInsets.only(left: 15),
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Branch',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue[800],
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 90,
            margin: EdgeInsets.only(left: 15),
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'if you asked for a branch addresswhen setting up a Direct Debit, enter the following details:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Container(
            height: 80,
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
            margin: EdgeInsets.all(15),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Manage regular payments, payment permissions, cheques and contactless mobile.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
