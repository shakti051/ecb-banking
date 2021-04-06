import 'dart:async';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:easymoney/widgets/alertBox.dart';
import 'package:flutter/services.dart';
import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:easymoney/utils/network_util.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> _signupKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final paswordControler = TextEditingController();
  final emailReg = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final util = Util();
  bool isTermsAccepted = false;
  VideoPlayerController _controller;
  bool _visible = false;
  String username, password = '';
  final storage = new FlutterSecureStorage();

  // Future<Null> _setUserLogindetail(
  //   token,
  // ) async {
  //   final storage = new FlutterSecureStorage();
  //   await storage.write(key: "_username", value: emailController.text);
  //   await storage.write(key: "_userpassword", value: paswordControler.text);
  //   await storage.write(key: "_isFirstLogin", value: 'no');
  //   await storage.write(key: "_accessToken", value: token);
  //   await storage.write(key: "_name", value: nameController.text);
  // }

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
      //appBar: AppBar(),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 200),
//            Padding(
//              padding: const EdgeInsets.fromLTRB(25, 50, 25, 20),
//              child: Center(
//                child: Image(
//                  image: AssetImage("assets/images/logo.png"),
//                  width: 100.0,
//                ),
//              ),
//            ),
              Container(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: EdgeInsets.fromLTRB(25, 25, 25, 20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Form(
                            key: _signupKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CustomTextFieldWidget(
                                    description: '',
                                    textEditingController: nameController,
                                    label: 'Name',
                                    inputType: TextInputType.text,
                                    onFieldSubmitted: (String value) {},
                                    onValidate: (String value) {
                                      if (value.isEmpty) {
                                        return 'Name field cannot be Empty.';
                                      }
                                      return null;
                                    },
                                    isObscure: false),
                                CustomTextFieldWidget(
                                    description: '',
                                    textEditingController: emailController,
                                    label: 'Email Address',
                                    inputType: TextInputType.emailAddress,
                                    onFieldSubmitted: (String value) {},
                                    onValidate: (String value) {
                                      if (value.isEmpty) {
                                        return 'Email field cannot be Empty.';
                                      }
                                      if (!emailReg.hasMatch(value)) {
                                        return 'Email is incorrect.';
                                      }
                                      return null;
                                    },
                                    isObscure: false),
                                CustomTextFieldWidget(
                                    description: '',
                                    textEditingController: paswordControler,
                                    label: 'Password',
                                    inputType: TextInputType.visiblePassword,
                                    onFieldSubmitted: (String value) {},
                                    onValidate: (String value) {
                                      if (value.isEmpty) {
                                        return "Password field cannot be Empty.";
                                      } else if (value.length < 6) {
                                        return "Password should be atleast 6 characters";
                                      } else if (value.length > 15) {
                                        return "Password should not be greater than 15 characters";
                                      } else
                                        return null;
                                    },
                                    isObscure: false),
                                SizedBox(height: 30),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  runAlignment: WrapAlignment.center,
                                  children: <Widget>[
                                    Checkbox(
                                        activeColor: util.mainColor,
                                        value: isTermsAccepted,
                                        onChanged: (bool isChecked) {
                                          setState(() {
                                            isTermsAccepted = !isTermsAccepted;
                                          });
                                        }),
                                    RichText(
                                        text: TextSpan(
                                            text:
                                            'By creating an account, you agree to our ',
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                .copyWith(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400),
                                            children: [
                                              TextSpan(
                                                  text: '\nTerms & Conditions',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      .copyWith(
                                                      color: util.mainColor,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600))
                                            ]))
                                  ],
                                ),
                                SizedBox(height: 30),
                                CustomButtomWidget(
                                    text: 'Sign up',
                                    isHasIcon: false,
                                    textColor: Colors.white,
                                    backgroundColor: isTermsAccepted
                                        ? util.mainColor
                                        : util.mainColor.withOpacity(.3),
                                    onTap: () {
                                      if (_signupKey.currentState.validate()) {
                                        var headers = {
                                          'Content-Type':
                                          'application/x-www-form-urlencoded',
                                        };
                                        var bodyFields = {
                                          'name': nameController.text,
                                          'email': emailController.text,
                                          'password': paswordControler.text,
                                          'password_confirmation':
                                          paswordControler.text
                                        };
                                        try {
                                          postreq('register', headers, bodyFields,
                                              context)
                                              .then((res) {
                                                print(res);
                                            if (res['statusCode'] == 200) {

                                              _setUserLogindetail(
                                                  res['responce']
                                                  ['access_token'],
                                                  res['responce']['user']
                                                  ['name'],
                                                  "0");

                                              Navigator.pushReplacementNamed(
                                                  context, '/letstart');
//                                              Navigator.pushReplacementNamed(
//                                                  context, '/home');
                                            } else {
                                              AlertBox(res['responce'], "error",
                                                  context);
                                            }
                                          });
                                        } catch (error) {
                                          AlertBox(error, "error", context);
                                        }
                                      }
                                      return false;
                                    }),
                                SizedBox(height: 30),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                height: MediaQuery.of(context).size.height*0.7,
              ),
              GestureDetector(
                onTap: () {
                  //Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Center(
                  child: RichText(
                      text: TextSpan(
                          text: 'Already have an account?  ',
                          style: Theme.of(context).textTheme.caption.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          children: [
                            TextSpan(
                                text: 'Login',
                                style: Theme.of(context).textTheme.caption.copyWith(
                                    color: Colors.yellow,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))
                          ])),
                ),
              ),
              SizedBox(height: 50)
            ],
          ),
        ),
      ),
    );
  }

  void _setUserLogindetail(token, name, kyc) {
    print("Token: $token");
    print("Name: $name");
    print("kyc: $kyc");
    storage.write(key: "_username", value: emailController.text);
    storage.write(key: "_userpassword", value: paswordControler.text);
    storage.write(key: "_isFirstLogin", value: 'yes');
    storage.write(key: "_accessToken", value: token);
    storage.write(key: "_name", value: nameController.text);
    storage.write(key: "_kyc", value: kyc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      resizeToAvoidBottomInset: false,
//      backgroundColor: const Color(0x000000).withOpacity(0.1),
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
}
