import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScheduledPaymentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Scheduled payments"),
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
            height: 150,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              color: Colors.grey[200],
            ),
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Image.asset(
                'assets/images/calender.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 30, 40),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue[800],
              padding: EdgeInsets.all(15),
              onPressed: () {
                // Respond to button press
              },
              child: Text('Schedule a new payment'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue[800])),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 20),
            child: Text(
              'It looks like you haven\'t set up a scheduled payments yet',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'When you do, you will be able to view and delete them from here',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
