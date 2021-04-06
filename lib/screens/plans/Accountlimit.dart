import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class AccountLimits extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const AccountLimits(
      {Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Account Limits"),
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
        margin: EdgeInsets.only(bottom: 40),
        child: ListView(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'ACCOUNT LIMITS',
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            margin: EdgeInsets.zero,
            color: Colors.white,
            child: ListTile(
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        "Maximum account balance",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324',
                        style: TextStyle(color: Colors.black45, fontSize: 15.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324 Balance remaining',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "ACCOUNT TRANSACTION LIMITS",
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        "Monthly limit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324',
                        style: TextStyle(color: Colors.black45, fontSize: 15.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324 Balance remaining',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                    ),
                  ]),
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 1),
            color: Colors.white,
            child: ListTile(
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        "Single Outbound Transaction Limit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324',
                        style: TextStyle(color: Colors.black45, fontSize: 15.0),
                      ),
                    ),
                  ]),
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 1),
            color: Colors.white,
            child: ListTile(
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        "Single Inbound Transaction Limit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324',
                        style: TextStyle(color: Colors.black45, fontSize: 15.0),
                      ),
                    ),
                  ]),
            ),
          ),
          //------------ Card Start-------------------//
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "CARD TRANSACTIONS",
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        "Monthly limit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324',
                        style: TextStyle(color: Colors.black45, fontSize: 15.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324 Balance remaining',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                    ),
                  ]),
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        "Daily Limit per account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324',
                        style: TextStyle(color: Colors.black45, fontSize: 15.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324 Balance remaining',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                    ),
                  ]),
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        "ATM withdrawal Limit",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324',
                        style: TextStyle(color: Colors.black45, fontSize: 15.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '£234324 Balance remaining',
                        style: TextStyle(color: Colors.black, fontSize: 15.0),
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(height: 22),
          Padding(
            padding: EdgeInsets.all(5),
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.blue[800],
              padding: EdgeInsets.all(15),
              onPressed: () {
                // Respond to button press
              },
              child: Text('Request limit increase'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue[800])),
            ),
          ),

          //------------ Card End-------------------//
        ]),
      ),
    );
  }
}
