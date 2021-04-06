import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Support extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const Support({Key key, this.menuScreenContext, this.hideStatus = false})
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
            title: Text("Support"),
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Container(
            child: ListView(children: <Widget>[
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Colors.blue[800],
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x10000000),
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: Offset(0.0, 4.0))
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    style: TextStyle(
                        fontSize: 18.0, height: 1.0, color: Colors.white),
                    decoration: InputDecoration(
                      labelText: "Search",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Text(
                    'SUGGESTED FAQs',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.only(bottom: 2),
                      color: Colors.white,
                      child: ListTile(
                        title: Text(
                          'What are my account limits?',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                        title: Text(
                          'How long do outbound payment take',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                        title: Text(
                          'How do i deposite cash ?',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
              Container(
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 20),
                  child: Text(
                    'STILL NEED HELP ?',
                    style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                height: 180,
                child: ListView(
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.only(bottom: 2),
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(
                          Icons.confirmation_number_sharp,
                          color: Colors.blue[600],
                          size: 30,
                        ),
                        title: Text(
                          'See all FAQs',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                          Icons.question_answer_outlined,
                          color: Colors.blue[600],
                          size: 30,
                        ),
                        title: Text(
                          'Messages',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                          Icons.edit_rounded,
                          color: Colors.blue[600],
                          size: 30,
                        ),
                        title: Text(
                          'New Message',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
