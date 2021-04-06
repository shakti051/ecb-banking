import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PayeeAddInternational extends StatelessWidget {
  final String country;
  //requiring the list of todos
  PayeeAddInternational({Key key, @required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Recipient Details"),
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Text('Enter recipient details'),
          ),
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
              margin: EdgeInsets.all(20),
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        //prefixIcon: Icon(Icons.edit),
                        labelText: 'Recipient Name',
                        hintText: "Enter Account",
                        suffixIcon: Icon(Icons.edit),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      readOnly: true,
                      enabled: false,
                      controller: TextEditingController(text: country),
                      decoration: InputDecoration(
                        labelText: 'Country',
                        suffixIcon: Icon(Icons.flag),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                ],
              )),
        ]),
      ),
    );
  }
}
