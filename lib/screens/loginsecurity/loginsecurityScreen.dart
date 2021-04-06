import "package:flutter/material.dart";

class LoginsecurityScreen extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const LoginsecurityScreen(
      {Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Login and security"),
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
          SizedBox(
            height: 15.0,
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.face_unlock_sharp, color: Colors.blue[900]),
              title: Text(
                'Face ID',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.navigate_next, color: Colors.blue[900]),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => DashboardPagen()),
                // );
              },
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.lock, color: Colors.blue[900]),
              title: Text(
                'Change security Code',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.navigate_next, color: Colors.blue[900]),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) => DashboardPagen()),
                // );
              },
            ),
          ),
          SizedBox(height: 15),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              leading:
                  Icon(Icons.phone_android_outlined, color: Colors.blue[900]),
              title: Text(
                'Manage Phones',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.navigate_next, color: Colors.blue[900]),
              onTap: () {},
            ),
          ),
          SizedBox(height: 15),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.account_balance, color: Colors.blue[900]),
              title: Text(
                'Open Banking',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.navigate_next, color: Colors.blue[900]),
              onTap: () {},
            ),
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.mail_outline, color: Colors.blue[900]),
              title: Text(
                'Contact Preferences',
                style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: 18,
                ),
              ),
              trailing: Icon(Icons.navigate_next, color: Colors.blue[900]),
              onTap: () {},
            ),
          ),
        ]),
      ),
    );
  }
}
