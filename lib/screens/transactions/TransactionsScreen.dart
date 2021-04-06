import "package:flutter/material.dart";

class TransactionsScreen extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const TransactionsScreen(
      {Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800], // status bar color
        brightness: Brightness.dark,
        title: Text("Transactions"),
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
            height: 20.0,
          ),
          Card(
            margin: EdgeInsets.only(bottom: 2),
            color: Colors.white,
            child: ListTile(
              leading: Icon(Icons.book, color: Colors.blue[900]),
              title: Text(
                'Direct debit',
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
              leading: Icon(Icons.book, color: Colors.blue[900]),
              title: Text(
                'Standing Orders',
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
              leading: Icon(Icons.date_range, color: Colors.blue[900]),
              title: Text(
                'Scheduled payments',
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
