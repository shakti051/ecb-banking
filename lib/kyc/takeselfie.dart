import 'dart:io';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'cameraScreen.dart';
import 'docsfront.dart';

class TakeSelfie extends StatefulWidget {
  final String docsType;

  TakeSelfie({Key key, this.docsType}) : super(key: key);

  @override
  _TakeSelfieState createState() => _TakeSelfieState();
}

class _TakeSelfieState extends State<TakeSelfie> {
  var imagePath;

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
            // leading: Builder(
            //   builder: (BuildContext context) {
            //     return IconButton(
            //       color: Colors.black,
            //       onPressed: () => Navigator.pop(context),
            //       icon: Icon(Icons.arrow_back),
            //       alignment:
            //           Alignment(-0.5, 0.0), // move icon a bit to the left
            //     );
            //   },
            // ),
          ),
          body: ListView(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Take a selfie',
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
                    'Get ready to snap a photo of youself.',
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ),
                Padding(padding: EdgeInsets.all(25)),
                Container(height: 1, color: Colors.grey[200]),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: imagePath == null
                      ? Image.asset('assets/images/takeselfie.png')
                      : Image.file(File(imagePath)),
                ),
              ]),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                if (imagePath == null)
                  _openCameraScreen(context);
                else
                  pushNewScreen(context,
                      screen: DocFront(
                        docsType: widget.docsType,
                        selfiePath: imagePath,
                      ));
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text('CONTINUE'),
            ),
          ),
        ),
      ),
    );
  }

  void _openCameraScreen(BuildContext context) async {
    String result = await Navigator.push(
        context,
        new MaterialPageRoute(
          builder: (BuildContext context) => new CameraScreen(),
        ));

    setState(() {
      imagePath = result;
    });
    print("RESULT-> $result");
//    Navigator.of(menuScreenContext);
  }
}
