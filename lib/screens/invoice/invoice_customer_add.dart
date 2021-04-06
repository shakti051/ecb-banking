import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class InvoiceAddCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Add Customer"),
        centerTitle: true,
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
          SizedBox(
            height: 15,
          ),
          Container(
            height: 200,
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your username'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your username'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your username'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your username'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your username'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your username'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Enter your username'),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
