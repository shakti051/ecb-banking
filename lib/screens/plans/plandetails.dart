import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanDetails extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const PlanDetails({Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Plan Details"),
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
        margin: EdgeInsets.only(bottom: 40),
        child: ListView(children: <Widget>[
          Container(
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
              boxShadow: [
                BoxShadow(
                    color: Colors.white,
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
                  right: 20,
                  child: Icon(
                    Icons.speaker,
                    size: 100.0,
                    color: Colors.blue[800],
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: Text(
                    'CURRENT PLAN',
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                    top: 50,
                    left: 20,
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue[800],
                      onPressed: () {},
                      child: Text('SILVER'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.blue[800])),
                    )),
              ],
            ),
          ),

          Card(
            margin: EdgeInsets.only(top: 6),
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.speaker,
                color: Colors.blue[600],
                size: 30,
              ),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        'Vertical blue card',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Free card with each account',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Free team cards',
                        style: TextStyle(color: Colors.black45, fontSize: 15.0),
                      ),
                    ),
                  ]),
              onTap: null,
            ),
          ),

          Card(
            margin: EdgeInsets.only(top: 1),
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.blue[600],
                size: 30,
              ),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        'Instant chat support',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        '7 Days a week',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ),
                  ]),
              onTap: null,
            ),
          ),

          Card(
            margin: EdgeInsets.only(top: 1),
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.swap_horizontal_circle,
                color: Colors.blue[600],
                size: 30,
              ),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        'No monthly fees',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Card transactions - free',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ),
                  ]),
              onTap: null,
            ),
          ),

          Card(
            margin: EdgeInsets.only(top: 1),
            color: Colors.white,
            child: ListTile(
              leading: Icon(
                Icons.local_pizza,
                color: Colors.blue[600],
                size: 30,
              ),
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        'fees',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Incoming payments -20p',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Outgoing payments -20p',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'ATM withdrawal - £1',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Post office deposites - £1',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'PayPoint cash deposite - 2.5%',
                        style: TextStyle(color: Colors.black38, fontSize: 14.0),
                      ),
                    ),
                  ]),
              onTap: null,
            ),
          ),

          //------------ Card End-------------------//
        ]),
      ),
    );
  }
}
