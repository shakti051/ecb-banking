import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Helps extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const Helps({Key key, this.menuScreenContext, this.hideStatus = false})
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
            title: Text("Helps"),
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            // leading: Builder(
            //   builder: (BuildContext context) {
            //     return IconButton(
            //       onPressed: () => Navigator.pop(context),
            //       icon: Icon(Icons.arrow_back_ios_outlined),
            //       alignment:
            //           Alignment(-0.5, 0.0), // move icon a bit to the left
            //     );
            //   },
            // ),
          ),
          body: Container(
            child: ListView(children: <Widget>[
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                child: Text(
                  'Using the app',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 130,
                margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                ),
                child: Container(
                    padding: EdgeInsets.only(top: 15),
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
                            onPressed: () {},
                            elevation: 0.0,
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                Image.asset('assets/icons/faqs.png',
                                    height: 60),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'FAQs',
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
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            elevation: 0.0,
                            child: Column(
                              children: <Widget>[
                                Image.asset('assets/icons/whatsnew.png',
                                    height: 60),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'What\'s new',
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
                          child: RaisedButton(
                            onPressed: () {},
                            color: Colors.white,
                            elevation: 0.0,
                            child: Column(
                              children: <Widget>[
                                Image.asset('assets/icons/takeatour.png',
                                    height: 60),
                                Padding(
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(
                                    'Take a tour',
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
                    )),
              ),
              Container(
                height: 70,
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                ),
                child: Card(
                  margin: EdgeInsets.only(bottom: 2),
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 5.0, top: 15),
                            child: Text(
                              "Report card lost or stolan",
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ]),
                    trailing:
                        Icon(Icons.navigate_next, size: 30, color: Colors.blue),
                    onTap: null,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                constraints: BoxConstraints(minHeight: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                ),
                child: Card(
                  margin: EdgeInsets.only(bottom: 2),
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 5.0, top: 15),
                            child: Text(
                              "Take Five to stop Fraud",
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              ' Help protect yourself from faud and scams with straightforward advice from the national take five campaign - backend by UK banks, the police and the goverment.',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 14.0),
                            ),
                          ),
                        ]),
                    trailing:
                        Icon(Icons.navigate_next, size: 30, color: Colors.blue),
                    onTap: null,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                constraints: BoxConstraints(minHeight: 50.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.white,
                ),
                child: Card(
                  margin: EdgeInsets.only(bottom: 2),
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 5.0, top: 15),
                            child: Text(
                              "Register the app on a new device",
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              'Generate an activation code that you can use to quickly and securely move your registration to a new device.',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 14.0),
                            ),
                          ),
                        ]),
                    trailing:
                        Icon(Icons.navigate_next, size: 30, color: Colors.blue),
                    onTap: null,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
