import 'package:easymoney/screens/aboutapp/aboutapp.dart';
import 'package:easymoney/screens/accountancy/accountancy.dart';
import 'package:easymoney/screens/dashboard_page.dart';
import 'package:easymoney/screens/loginsecurity/loginsecurityScreen.dart';
//import 'package:easymoney/screens/plans/PlanScreen.dart';
import 'package:easymoney/screens/productstools/productsntools.dart';
import 'package:easymoney/screens/profile/profile.dart';
import 'package:easymoney/screens/servicestatus/service_status.dart';
import 'package:easymoney/screens/support/help.dart';
import 'package:easymoney/screens/transactions/TransactionsScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'auth/login_screen.dart';
import 'cards/card_screen.dart';
import 'invoice/invoice_customer_add.dart';

class Navmore extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;

  const Navmore({Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.blue[800],
            // status bar color
            brightness: Brightness.dark,
            title: Text("More"),
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Container(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x10000000),
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset: Offset(0.0, 4.0))
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: Text(
                      'Gaurav Account',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.book, color: Colors.blue[900]),
                    title: Text(
                      'Account',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      pushNewScreen(context, screen: DashboardPagen());
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 0),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.credit_card, color: Colors.blue[900]),
                    title: Text(
                      'Manage Card & PINS',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      pushNewScreen(context, screen: CardScreen());
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.list_alt, color: Colors.blue[900]),
                    title: Text(
                      'Transactions',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      pushNewScreen(context, screen: TransactionsScreen());
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.local_activity_outlined,
                        color: Colors.blue[900]),
                    title: Text(
                      'Plan',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
  //                    pushNewScreen(context, screen: PlanScreen());
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading:
                        Icon(Icons.loyalty_outlined, color: Colors.blue[900]),
                    title: Text(
                      'Invoice',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      pushNewScreen(context, screen: InvoiceAddCustomer());
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading:
                        Icon(Icons.people_outline, color: Colors.blue[900]),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      pushNewScreen(context, screen: Profile());
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.phonelink_lock_outlined,
                        color: Colors.blue[900]),
                    title: Text(
                      'Login and security',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginsecurityScreen()),
                      );
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.room_preferences_outlined,
                        color: Colors.blue[900]),
                    title: Text(
                      'Product & Tools',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      pushNewScreen(context, screen: Products());
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading:
                        Icon(Icons.source_outlined, color: Colors.blue[900]),
                    title: Text(
                      'Accountancy software',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      pushNewScreen(context, screen: Accountancy());
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.public, color: Colors.blue[900]),
                    title: Text(
                      'Service Status',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      pushNewScreen(context, screen: ServiceStatus());
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.add_photo_alternate_outlined,
                        color: Colors.blue[900]),
                    title: Text(
                      'Add Account',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionsScreen()),
                      );
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.phonelink, color: Colors.blue[900]),
                    title: Text(
                      'About App',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutApp()),
                      );
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading: Icon(Icons.perm_phone_msg_outlined,
                        color: Colors.blue[900]),
                    title: Text(
                      'Help',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                    ),
                    trailing:
                        Icon(Icons.navigate_next, color: Colors.blue[900]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Helps()),
                      );
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: ListTile(
                    leading:
                        Icon(Icons.power_settings_new, color: Colors.red[700]),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red[700],
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      _doLogout(context);
                    },
                  ),
                ),
                Container(
                  height: 120,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x3597d999),
                          blurRadius: 0,
                          spreadRadius: 0,
                          offset: Offset(0.0, 4.0))
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: ListView(children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.star_rate,
                          color: Colors.blue[900],
                          size: 30,
                        ),
                      ),
                      Text(
                        'Share the love, share 100',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        'Invite frient to join and you\'ll both get 50 once they\'re up and running!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 100,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        primary: false,
                        padding: const EdgeInsets.all(0),
                        crossAxisSpacing: 20,
                        shrinkWrap: true,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.computer,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Login in on your computer',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.white,
                              elevation: 0.0,
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.credit_card,
                                    color: Colors.blue,
                                    size: 40,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                    child: Text(
                                      'Credit',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.copyright, color: Colors.grey[500]),
                  contentPadding: EdgeInsets.all(50),
                  title: Text(
                    'Version 1.0,     easymoney',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _doLogout(context) {
//    print("LOGOUT");
//    Navigator.popAndPushNamed(menuScreenContext, '/');
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//          builder: (context) => TransactionsScreen()),
//    );
//    pushNewScreen(context, screen: LoginPage());
//    Navigator.pushReplacement(
//      menuScreenContext,
//      MaterialPageRoute(
//          builder: (context) => LoginPage()),
//    );
  }
}
