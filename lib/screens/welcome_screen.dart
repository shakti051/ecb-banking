import 'dart:async';

import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:easymoney/utils/util.dart';
import 'package:easymoney/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  VideoPlayerController _controller;
  bool _visible = false;
  bool isValid = true;
  bool showFloatingToast = false;
  Widget screen;
  bool isTermsAccepted = false;
  String isFirstTime;
  String isLocalauthenable;

  final util = Util();
  final usernameController = TextEditingController();
  final paswordControler = TextEditingController();
  final storage = new FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _controller = VideoPlayerController.asset("assets/videos/preview.mp4");
    _controller.initialize().then((_) {
      _controller.setLooping(true);
      Timer(Duration(milliseconds: 10), () {
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

  _getBackgroundColor() {
    return Container(
      color: Colors.blue.withAlpha(120),
    );
  }

  _getContent() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 150),
//          Center(
//            child: Image(
//              image: AssetImage("assets/images/logo.png"),
//              width: 290.0,
//            ),
//          ),
          //Spacer(),
//          SizedBox(
//            height: 60,
//          ),
          Text(
            'Welcome',
            style: new TextStyle(
              fontSize: 40.0,
              color: Colors.white,
            ),
          ),
          Text(
            'Lava Banking',
            style: new TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'seamless & intuitively',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 12),
          CustomButtomWidget(
            textColor: Colors.blue,
            isHasIcon: true,
            backgroundColor: Colors.white,
            text: 'Sign in',
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: FontAwesome.sign_in,
          ),
          SizedBox(height: 25),
          CustomButtomWidget(
            textColor: Colors.white,
            isHasIcon: true,
            backgroundColor: Colors.blue,
            text: 'Create an account',
            onTap: () {
              Navigator.pushNamed(context, '/signup');
              // Navigator.of(context).pushNamedAndRemoveUntil(
              //     '/signup', (Route<dynamic> route) => false);
              // Navigator.pushNamedAndRemoveUntil(context,
              //     MaterialPageRoute(builder: (context) => SignupPage()));
            },
            icon: FontAwesome.edit,
          ),
        ],
      ),
    );
  }

  Widget _useScreen() {
    return _getContent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              _getVideoBackground(),
              _getBackgroundColor(),
              _useScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
