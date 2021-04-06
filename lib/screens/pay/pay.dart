import 'package:easymoney/screens/pay/directdebit.dart';
import 'package:easymoney/screens/pay/international/internationalpayment.dart';
import 'package:easymoney/screens/pay/payee_an_account.dart';
import 'package:easymoney/screens/pay/payee_between_account.dart';
import 'package:easymoney/screens/pay/schedulepayment.dart';
import 'package:easymoney/screens/pay/standinforders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Pays extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const Pays({Key key, this.menuScreenContext, this.hideStatus = false})
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
            backgroundColor: Colors.blue[800], // status bar color
            brightness: Brightness.dark,
            title: Text("Pay & Transfer"),
            centerTitle: true,
            automaticallyImplyLeading: false,
            //leading: Icon(Icons.arrow_back_ios_outlined),
          ),
          body: Container(
            child: ListView(children: <Widget>[
              Container(
                height: 250,
                padding: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x10000000),
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: Offset(2.0, 2.0))
                  ],
                ),
                margin: EdgeInsets.all(15),
                child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(0),
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      crossAxisCount: 3,
                      children: <Widget>[
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              pushNewScreen(context, screen: PayeeanAccount());
                            },
                            elevation: 0.0,
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Image.asset('assets/icons/payn_new.png',
                                    height: 60),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Pay a recent or new payee',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              pushNewScreen(context,
                                  screen: InternationalpaymentScreen());
                            },
                            color: Colors.white,
                            elevation: 0.0,
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                    'assets/icons/international_pay.png',
                                    height: 60),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'International paymnet',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              pushNewScreen(context,
                                  screen: PaybetweenAccount());
                            },
                            color: Colors.white,
                            elevation: 0.0,
                            child: Column(
                              children: <Widget>[
                                Image.asset('assets/icons/transfer_weetben.png',
                                    height: 60),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Transfer between accounts',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              pushNewScreen(context, screen: DirectDebit());
                            }, //DirectDebit
                            color: Colors.white,
                            elevation: 0.0,
                            child: Column(
                              children: <Widget>[
                                Image.asset('assets/icons/direct_dabit.png',
                                    height: 60),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Direct debits',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              pushNewScreen(context,
                                  screen: ScheduledPaymentsScreen());
                            },
                            color: Colors.white,
                            elevation: 0.0,
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                    'assets/icons/scheduled_payment.png',
                                    height: 60),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Scheduled payments',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: RaisedButton(
                            onPressed: () {
                              pushNewScreen(context,
                                  screen: StandingOrdersScreen());
                            },
                            color: Colors.white,
                            elevation: 0.0,
                            child: Column(
                              children: <Widget>[
                                Image.asset('assets/icons/standing_order.png',
                                    height: 60),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Standing orders',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 12),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                height: 120,
                padding: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x10000000),
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: Offset(2.0, 2.0))
                  ],
                ),
                margin: EdgeInsets.all(15),
                child: ListView(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Manage your payments',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Manage regular payments, payment permissions, cheques and contactless mobile.',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
