import 'dart:convert';
import 'dart:io';

import 'package:easymoney/constants/constants.dart';
import 'package:easymoney/widgets/alertBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:progress_dialog/progress_dialog.dart';

import 'cameraScreen.dart';

class DocBack extends StatefulWidget {
  final String docsType;
  final String selfiePath;
  final String frontDocPath;

  DocBack({Key key, this.docsType, this.selfiePath, this.frontDocPath})
      : super(key: key);

  @override
  _DocBackState createState() => _DocBackState();
}

class _DocBackState extends State<DocBack> {
  var imagePath;
  bool _showLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          key: _scaffoldKey,
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
          body: Stack(
            children: [
              ListView(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Turn your ${widget.docsType} around',
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
                        'Turn your ${widget.docsType} around and take a photo of the other side.',
                        style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(25)),
                    Container(height: 1, color: Colors.grey[200]),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: imagePath == null
                          ? Image.asset('assets/images/licensepic.png')
                          : Image.file(File(imagePath)),
                    ),
                  ]),
              Visibility(
                  visible: _showLoading,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 5),
                  )),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                if (imagePath == null)
                  _openCameraScreen(context);
                else
                  _doSubmit();
//                 pushNewScreen(context, screen: );
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(imagePath == null ? 'CONTINUE' : 'SUBMIT'),
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

  void _doSubmit() {
    print("SELFIE:  ${widget.selfiePath}");
    print("FRONT:  ${widget.frontDocPath}");
    print("BACK:  $imagePath");
    _doAPICall();
  }

  void _doAPICall() async {
    try {
      String token = await FlutterSecureStorage().read(key: "_accessToken");

      var pr = ProgressDialog(context,
          type: ProgressDialogType.Normal,
          isDismissible: true,
          showLogs: false);
      await pr.show();

      var req =
          http.MultipartRequest('POST', Uri.parse("${BASE_URL}kyc/upload"));

      req.headers['Authorization'] = 'Bearer $token';
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded';
      req.files.add(
          await http.MultipartFile.fromPath('kycdocselfie', widget.selfiePath));
      req.files.add(await http.MultipartFile.fromPath(
          'kycdocfront', widget.frontDocPath));
      req.files.add(await http.MultipartFile.fromPath('kycdocback', imagePath));

      var response = await req.send();
      var body = await response.stream.bytesToString();
      await pr.hide();

      print(body);
      if (response.statusCode == 200) {
        await FlutterSecureStorage().write(key: "_kyc", value: "1");
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
        return;
      } else {
        Map<String, dynamic> map = json.decode(body);

        AlertBox('${map['message']}', "error", context);
        return;
      }
    } catch (error) {
      AlertBox(error, "error", context);
    }
  }
}
