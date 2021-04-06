import 'package:easymoney/kyc/complete_kyc.dart';
import 'package:easymoney/kyc/countryselection.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Letsstart extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const Letsstart({Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white, // status bar color
            brightness: Brightness.dark,
            centerTitle: true,
            elevation: 0,
            /*leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  color: Colors.black,
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close),
                  alignment:
                      Alignment(-0.5, 0.0), // move icon a bit to the left
                );
              },
            ),*/
          ),
          body: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Let\'s get you verified',
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                    textAlign: TextAlign.left,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'TO MAKE SURE YOU RE YOU:',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Chip(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        backgroundColor: Colors.blue,
                        label: Text('1', style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.lightBlue[50],
                          margin: EdgeInsets.all(10),
                          child: Text(
                              'Prepaire a valid government-issued identity document'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Chip(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        backgroundColor: Colors.blue,
                        label: Text('2', style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.lightBlue[50],
                          margin: EdgeInsets.all(10),
                          child: Text('Make sure you are in a wll-lit room'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Chip(
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                        backgroundColor: Colors.blue,
                        label: Text('3', style: TextStyle(color: Colors.white)),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.lightBlue[50],
                          margin: EdgeInsets.all(10),
                          child: Text(
                              'Be prepared to take a selfie and photos of your ID'),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Your session audio and video will be recorded, identity verification is conducted using automantion. Read more about personal data processing in our Privacy Policy',
                            style:
                                TextStyle(color: Colors.black38, fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          color: Colors.transparent,
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            onPressed: () {
                              pushNewScreen(context, screen: CompleteYourKyc());
                            },
                            color: Colors.blue[500],
                            child: Text(
                              "START SESSION",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
