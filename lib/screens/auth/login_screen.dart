import 'dart:async';
import 'dart:io';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:easymoney/kyc/kyc_status.dart';
import 'package:easymoney/kyc/letstart.dart';
import 'package:easymoney/models/login_model.dart';
import 'package:easymoney/services/login_service.dart';
import 'package:easymoney/utils/network_util.dart';
import 'package:easymoney/widgets/alertBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:video_player/video_player.dart';

import '../../utils/util.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_textfield_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final util = Util();
  final usernameController = TextEditingController();
  final paswordControler = TextEditingController();
  final emailReg = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  VideoPlayerController _controller;
  bool _visible = false;
  bool isValid = true;
  bool showFloatingToast = false;
  final storage = new FlutterSecureStorage();
  LoginService api = LoginService();
  LoginModel loginModel;

  void _setUserLogindetail(token, name, kyc) {
    storage.write(key: "_username", value: usernameController.text);
    storage.write(key: "_userpassword", value: paswordControler.text);
    storage.write(key: "_isFirstLogin", value: 'yes');
    storage.write(key: "_accessToken", value: token);
    storage.write(key: "_name", value: name);
    storage.write(key: "_kyc", value: kyc);
  }

  _getLogin(String username, String password) async {
    return api
        .getLogin(userName: username, userPassword: password)
        .then((value) {
      loginModel = value;
      // print("your kyc is " + loginModel.kyc.toString());
      // print("Your token is " + loginModel.accessToken.toString());

      if (loginModel.kyc.toString() == '0') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Letsstart()));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    KycStatus(kyc_msg: loginModel.accessToken.toString())));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller = VideoPlayerController.asset("assets/videos/preview.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 100), () {
        setState(() {
          _controller.play();
          _visible = true;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (_controller != null) {
      _controller.dispose();
      _controller = null;
    }
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 1000),
      child: SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: _controller.value.size?.width ?? 0,
            height: _controller.value.size?.height ?? 0,
            child: VideoPlayer(_controller),
          ),
        ),
      ),
    );
  }

  _getContent() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue.withAlpha(120),
//      backgroundColor: const Color(0x000000).withOpacity(0.1),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 150, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
//                  Center(
//                    child: Image(
//                      image: AssetImage("assets/images/logo.png"),
//                      width: 130.0,
//                    ),
//                  ),
                SizedBox(height: 100),
                Container(
                  padding: const EdgeInsets.all(25),
                  margin: EdgeInsets.fromLTRB(5, 25, 5, 20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              CustomTextFieldWidget(
                                  description: '',
                                  textEditingController: usernameController,
                                  label: 'Email',
                                  inputType: TextInputType.emailAddress,
                                  onFieldSubmitted: (String value) {},
                                  onValidate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Field cannot be Empty.';
                                    }
                                    return null;
                                  },
                                  isObscure: false),
                              CustomTextFieldWidget(
                                  description: '',
                                  textEditingController: paswordControler,
                                  label: 'Password',
                                  inputType: TextInputType.text,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: (String value) {},
                                  onValidate: (String value) {
                                    if (value.isEmpty) {
                                      return "Password field cannot be Empty.";
                                    } else
                                      return null;
                                  },
                                  isObscure: true),
                              SizedBox(height: 20),
                              IgnorePointer(
                                ignoring: !isValid,
                                ignoringSemantics: !isValid,
                                child: CustomButtomWidget(
                                    text: 'Login',
                                    isHasIcon: false,
                                    textColor: Colors.white,
                                    backgroundColor: isValid
                                        ? util.mainColor
                                        : util.mainColor.withOpacity(.3),
                                    onTap: () async {
                                      _getLogin(usernameController.text,
                                          paswordControler.text);

                                      // if (_formKey.currentState.validate()) {
                                      //   try {
                                      //     var headers = {
                                      //       'Content-Type':
                                      //           'application/x-www-form-urlencoded',
                                      //     };
                                      //     var bodyFields = {
                                      //       'email': usernameController.text,
                                      //       'password': paswordControler.text
                                      //     };
                                      //     postreq('login', headers, bodyFields,
                                      //             context)
                                      //         .then((res) {
                                      //       print(res);
                                      //       if (res['statusCode'] == 200) {
                                      //         _setUserLogindetail(
                                      //             res['responce']
                                      //                 ['access_token'],
                                      //             res['responce']['user']
                                      //                 ['name'],
                                      //             res['responce']['user']
                                      //                 ['is_kyc']);
                                      //         if (res['responce']['user']
                                      //                 ['is_kyc'] ==
                                      //             "1") {
                                      //           _doLocalAuth();
                                      //         } else {
                                      //           Navigator.of(context)
                                      //               .pushNamedAndRemoveUntil(
                                      //                   '/letstart',
                                      //                   (Route<dynamic>
                                      //                           route) =>
                                      //                       false);
                                      //         }
                                      //       } else {
                                      //         AlertBox(res['responce'], "error",
                                      //             context);
                                      //       }
                                      //     });
                                      //   } catch (error) {
                                      //     AlertBox(error, "error", context);
                                      //   }
                                      // }
                                    }),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/signup');
                  },
                  child: Center(
                    child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: Theme.of(context).textTheme.caption.copyWith(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            children: [
                          TextSpan(
                              text: 'Sign up',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(
                                      color: Colors.yellow,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600))
                        ])),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            _getVideoBackground(),
//            _getBackgroundColor(),
            _getContent(),
          ],
        ),
      ),
    );
  }

  _getBackgroundColor() {
    return Container(
      color: Colors.blue.withAlpha(120),
    );
  }

  void _moveToHome() {
    Navigator.popAndPushNamed(context, '/home');
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
              stickyAuth: false);

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
        _moveToHome();
      }
    } else {
      _moveToHome();
    }
    print("SR_TAG: canCheckBiometrics $canCheckBiometrics");

    return canCheckBiometrics;
  }
}
