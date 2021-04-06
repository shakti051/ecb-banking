import 'package:flutter/material.dart';

class Billing extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const Billing({Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Membership Billing"),
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
        height: MediaQuery.of(context).size.height,
        child: ListView(children: <Widget>[
          Card(
            margin: EdgeInsets.all(30),
            color: Colors.grey[200],
            elevation: 0,
            child: ListTile(
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 10),
                      child: Text(
                        'If you upgrade to a paid plan your plan bills will appear here',
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
              onTap: null,
            ),
          ),

          Positioned(
            bottom: 50,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue[800],
                padding: EdgeInsets.all(15),
                onPressed: () {
                  // Respond to button press
                },
                child: Text('See Upgrades'),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue[800])),
              ),
            ),
          ),

          //------------ Card End-------------------//
        ]),
      ),
    );
  }
}
