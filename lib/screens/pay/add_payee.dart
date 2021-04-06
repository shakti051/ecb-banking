import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PayeeAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Add payee"),
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
            height: 250,
            padding: EdgeInsets.only(top: 15),
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
            child: Padding(
              padding: EdgeInsets.all(5),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Enter Name'),
              ),
            ),
          ),
          Container(
            height: 120,
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
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Manage your payments',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Manage regular payments, payment permissions, cheques and contactless mobile.',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
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
