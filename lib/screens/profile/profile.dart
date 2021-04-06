import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const Profile({Key key, this.menuScreenContext, this.hideStatus = false})
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
            title: Text("Profile"),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
                  child: Text(
                    'Gaurav Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  'BUSINESS DETAILS',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
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
                          padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                          child: Text(
                            "Trading Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'International House, 24 Holborn Viaduct, Holborn, London EC1A 2BN, United Kingdom',
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  "PERSONAL DETAILS",
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Card(
                margin: EdgeInsets.only(bottom: 2),
                color: Colors.white,
                child: ListTile(
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'demo@user.test',
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
                margin: EdgeInsets.only(bottom: 2),
                color: Colors.white,
                child: ListTile(
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                          child: Text(
                            "Mobile number",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            '+44 56458765467',
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
                margin: EdgeInsets.only(bottom: 2),
                color: Colors.white,
                child: ListTile(
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                          child: Text(
                            "Home Address",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            '35/37, Ludgate Hill, London EC4M 7JN, United Kingdom',
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
            ]),
          ),
        ),
      ),
    );
  }
}
