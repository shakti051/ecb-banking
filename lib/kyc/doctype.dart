import 'package:easymoney/kyc/kyc_details.dart';
import 'package:easymoney/kyc/takeselfie.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Doctype extends StatefulWidget {
  @override
  _DoctypeState createState() => _DoctypeState();
}

class _DoctypeState extends State<Doctype> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            // status bar color
            brightness: Brightness.dark,
            centerTitle: true,
            elevation: 0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  color: Colors.black,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                  alignment:
                      Alignment(-0.5, 0.0), // move icon a bit to the left
                );
              },
            ),
          ),
          body: ListView(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Select ID Type',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 25),
                  child: Text(
                    'Which goverment-issued identity document would you like to use?',
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ),
                Padding(padding: EdgeInsets.all(25)),
                Container(height: 1, color: Colors.grey[200]),
                /*ListTile(
                  title: Text(
                    'Driver\'s license',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Image.asset(
                    'assets/icons/driverlicense.png',
                    height: 40,
                  ),
                  onTap: () => _moveToNext("Driver\'s license"),
                ),
                Container(height: 1, color: Colors.grey[200]),
                ListTile(
                  title: Text(
                    'Residence permit',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Image.asset(
                    'assets/icons/permit.png',
                    height: 40,
                  ),
                  onTap: () => _moveToNext("Residence permit"),
                ),
                Container(height: 1, color: Colors.grey[200]),*/
                ListTile(
                  title: Text(
                    'Passport',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Image.asset(
                    'assets/icons/passport.png',
                    height: 40,
                  ),
                  onTap: () => _moveToNext("Passport"),
                ),
                Container(height: 1, color: Colors.grey[200]),
              ]),
//          bottomNavigationBar: Padding(
//            padding: EdgeInsets.all(8.0),
//            child: RaisedButton(
//              onPressed: () {
//                pushNewScreen(context, screen: TakeSelfie());
//              },
//              color: Colors.blue,
//              textColor: Colors.white,
//              child: Text('CONTINUE'),
//            ),
//          ),
        ),
      ),
    );
  }

  void _moveToNext(String docsType) {

    pushNewScreen(context,
        screen: KYCDetails(
            docName:docsType
//          docsType: docsType,
        ));
  }
}
