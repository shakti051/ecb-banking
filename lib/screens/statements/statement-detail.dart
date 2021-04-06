import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class StatementsDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Statements"),
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
          Container(
            height: 180,
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
                  child:
                      Image.asset('assets/images/doc_serach.png', height: 70),
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Text(
                    'Please select the statement that you would like to download::',
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
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 5.0, top: 10),
                            child: Text(
                              "October",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              '01-oct-20 to 31-oct-20',
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 14.0),
                            ),
                          ),
                        ]),
                    trailing:
                        Icon(Icons.navigate_next, size: 30, color: Colors.blue),
                    onTap: null,
                  ),
                ),
                Card(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 5.0, top: 10),
                            child: Text(
                              "September",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              '01-sep-20 to 31-sep-20',
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 14.0),
                            ),
                          ),
                        ]),
                    trailing:
                        Icon(Icons.navigate_next, size: 30, color: Colors.blue),
                    onTap: null,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
