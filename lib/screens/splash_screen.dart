import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

class SplassScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplassScreenState();
}

class _SplassScreenState extends State<SplassScreen> {
  bool isValid = true;
  bool showFloatingToast = false;
  Widget screen;
  bool isTermsAccepted = false;
  String isFirstTime;
  String isLocalauthenable;
  final storage = new FlutterSecureStorage();

  _storageValue(ukey) async {
    String allValues = await storage.read(key: ukey);
    print("MTTAG____ Key: $ukey => value: $allValues");
    return allValues;
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    Timer(Duration(seconds: 2), () {
      _storageValue('_isFirstLogin').then((storeval) {
        if (storeval == null || storeval == 'no') {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/login', (Route<dynamic> route) => false);
        } else {
          _storageValue('_kyc').then((value) {
            if (value != null && value == "1") {
              _doLocalAuth();
            } else {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/letstart', (Route<dynamic> route) => false);
            }
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Image.asset(
//              'assets/images/logo.png',
//              width: 130,
//              height: 130,
//            ),
            Padding(
              padding: EdgeInsets.all(50),
              child: CircularProgressIndicator(
                strokeWidth: 5,
                // backgroundColor: Colors.cyanAccent[600],
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _moveToHome() {
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  Future<bool> _doLocalAuth() async {
    bool canCheckBiometrics = false;

    if (Platform.isIOS || Platform.isAndroid) {
      var localAuth = LocalAuthentication();
      try {
        canCheckBiometrics = await localAuth.canCheckBiometrics;
        if (canCheckBiometrics) {
          bool didAuthenticate = await localAuth.authenticateWithBiometrics(
              localizedReason: 'Please authenticate',
              useErrorDialogs: false,
              stickyAuth: true);

          if (didAuthenticate) {
            _moveToHome();
          }
          print("SR_TAG: didAuthenticate $didAuthenticate");
        } else {
          _moveToHome();
        }
      } catch (e) {
        print(e);
        canCheckBiometrics = false;
      }
    }
    print("SR_TAG: canCheckBiometrics $canCheckBiometrics");

    return canCheckBiometrics;
  }
}
