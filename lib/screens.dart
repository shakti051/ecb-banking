import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainScreen extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const MainScreen({Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    pushNewScreenWithRouteSettings(context,
                        settings: RouteSettings(name: '/home'),
                        screen: MainScreen2(),
                        pageTransitionAnimation:
                            PageTransitionAnimation.scaleRotate);
                  },
                  child: Text(
                    "Go to Second Screen ->",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: RaisedButton(
                  color: Colors.deepOrange,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      useRootNavigator: true,
                      builder: (context) => Center(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.blue,
                          child: Text(
                            "Exit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Push bottom sheet on TOP of Nav Bar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen2 extends StatelessWidget {
  const MainScreen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('Screen 2')),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  pushNewScreen(context, screen: MainScreen3());
                },
                child: Text(
                  "Go to Third Screen",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                color: Colors.indigo,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Go Back to First Screen",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen3 extends StatelessWidget {
  const MainScreen3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text('Screen 3')),
      body: Container(
        child: Center(
          child: RaisedButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Go Back to Second Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
