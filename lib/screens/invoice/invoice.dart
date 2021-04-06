import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'invoice-account.dart';

class Invoice extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const Invoice({Key key, this.menuScreenContext, this.hideStatus = false})
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
            title: Text("Statements"),
            centerTitle: true,
            leading: Container(),
//            leading: Builder(
//              builder: (BuildContext context) {
//                return IconButton(
//                  onPressed: () => Navigator.pop(context),
//                  icon: Icon(Icons.arrow_back_ios_outlined),
//                  alignment:
//                      Alignment(-0.5, 0.0), // move icon a bit to the left
//                );
//              },
//            ),
          ),
          body: Container(
            child: ListView(children: <Widget>[
              Container(
                height: 200,
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
                      child: Image.asset('assets/images/doc_serach.png',
                          height: 70),
                    ),
                    Positioned(
                      top: 100,
                      left: 20,
                      right: 20,
                      child: Text(
                        'Please select the account that you require a statemet for:',
                        style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 20,
                      right: 20,
                      child: Text(
                        'LOCAL ACCOUNTS',
                        style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                child: ListView(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.zero,
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.book,
                          color: Colors.blue[600],
                          size: 30,
                        ),
                        title: Text(
                          'Account',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                          ),
                        ),
                        trailing:
                            Icon(Icons.navigate_next, color: Colors.black87),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InvoiceMonth()),
                          );
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
