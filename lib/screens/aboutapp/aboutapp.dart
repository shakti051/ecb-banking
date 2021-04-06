import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AboutApp extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const AboutApp({Key key, this.menuScreenContext, this.hideStatus = false})
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
            title: Text("About App"),
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_outlined),
                  alignment:
                      Alignment(-0.5, 0.0), // move icon a bit to the left
                );
              },
            ),
          ),
          body: Container(
            child: ListView(children: <Widget>[
              Container(
                height: 150,
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
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Positioned(
                      top: 20,
                      child: Image.asset('assets/icons/faqs.png', height: 70),
                    ),
                    Positioned(
                      top: 100,
                      left: 20,
                      right: 20,
                      child: Text(
                        'Find Out about us:',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                child: ListView(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.only(bottom: 2),
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.info,
                          color: Colors.blue[600],
                          size: 30,
                        ),
                        title: Text(
                          'T&Cs',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        trailing:
                            Icon(Icons.navigate_next, color: Colors.black87),
                        onTap: () {
                          //InvoiceMonth
                        },
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(bottom: 2),
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.receipt_long,
                          color: Colors.blue[600],
                          size: 30,
                        ),
                        title: Text(
                          'Privacy Policy',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        trailing:
                            Icon(Icons.navigate_next, color: Colors.black87),
                        onTap: () {
                          //InvoiceMonth
                        },
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(bottom: 2),
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.vpn_lock,
                          color: Colors.blue[600],
                          size: 30,
                        ),
                        title: Text(
                          'Cookie Policy',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        trailing:
                            Icon(Icons.navigate_next, color: Colors.black87),
                        onTap: () {
                          //InvoiceMonth
                        },
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.zero,
                      color: Colors.white,
                      child: ListTile(
                        leading: Text(
                          '£',
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 24,
                          ),
                        ),
                        // Icon(
                        //   Icons.receipt_long,
                        //   color: Colors.blue[600],
                        //   size: 30, £
                        // ),
                        title: Text(
                          'Pricing',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        trailing:
                            Icon(Icons.navigate_next, color: Colors.black87),
                        onTap: () {
                          //InvoiceMonth
                        },
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
