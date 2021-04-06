import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertBox {
  final String title;
  final String content;
  final BuildContext context;

  AlertBox(this.title, this.content, this.context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 500),
        transitionBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) =>
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, 1), //Offset(0, -1)
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
                ),
              ),
              child: child,
            ),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  color: Colors.red[900],
                ),
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: EdgeInsets.only(top: 15),
                constraints: BoxConstraints(minHeight: 20.0),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                Text(
                                  title.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(buildContext);
                          },
                          child: Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
