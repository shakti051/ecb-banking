import 'package:easymoney/screens/plans/plandetails.dart';
import "package:flutter/material.dart";
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'Accountlimit.dart';
import 'billing.dart';

class PlanScreen extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const PlanScreen({Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Plans"),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios_outlined),
              alignment: Alignment(-0.5, 0.0), // move icon a bit to the left
            );
          },
        ),
      ),
      body: Container(
        child: ListView(children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.table_view, color: Colors.blue[900]),
              title: Text(
                'Plan Details',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.navigate_next, color: Colors.blue[900]),
              onTap: () {
                pushNewScreen(context, screen: PlanDetails());
              },
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.table_view, color: Colors.blue[900]),
              title: Text(
                'Change Plan',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.navigate_next, color: Colors.blue[900]),
              onTap: () {
                pushNewScreen(context, screen: AccountLimits());
              },
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.touch_app, color: Colors.blue[900]),
              title: Text(
                'Billing',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.navigate_next, color: Colors.blue[900]),
              onTap: () {
                pushNewScreen(context, screen: Billing());
              },
            ),
          ),
        ]),
      ),
    );
  }
}
