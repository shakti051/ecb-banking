import 'dart:io';

import 'package:easymoney/kyc/docsback.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'cameraScreen.dart';

class DocFront extends StatefulWidget {
  final String docsType;
  final String selfiePath;

  DocFront({Key key, this.docsType, this.selfiePath}) : super(key: key);

  @override
  _DocFrontState createState() => _DocFrontState();
}

class _DocFrontState extends State<DocFront> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var imagePath;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: _scaffoldKey,
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
                    'Front of ${widget.docsType}',
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
                    'Take a photo of the front of your ${widget.docsType}',
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ),
                Padding(padding: EdgeInsets.all(25)),
                Container(height: 1, color: Colors.grey[200]),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: imagePath == null
                      ? Image.asset('assets/images/docpickes.png')
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
                      screen: DocBack(
                        docsType: widget.docsType,
                        selfiePath: widget.selfiePath,
                        frontDocPath: imagePath,
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
          builder: (BuildContext context) => new CameraScreen(cameraId: 0),
        ));

    setState(() {
      imagePath = result;
    });
    print("RESULT-> $result");
//    Navigator.of(menuScreenContext);
  }
}
