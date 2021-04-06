import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'add_payee.dart';

enum SingingCharacter { lafayette, jefferson }
SingingCharacter _character = SingingCharacter.lafayette;

class PayeeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800], // status bar color
          brightness: Brightness.dark,
          title: Text("Add/Select payee"),
          centerTitle: true,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_outlined),
                alignment: Alignment(-0.5, 0.0), // move icon a bit to the left
              );
            },
          ),
          bottom: TabBar(
              labelPadding:
                  EdgeInsets.only(top: 0, right: 5, left: 5, bottom: 0),
              labelColor: Colors.blue[800],
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(0),
              indicatorWeight: 2,
              indicatorColor: Colors.blue[100],
              //isScrollable: false,
              indicator: BoxDecoration(
                  border: Border.all(color: Colors.blue[800], width: 8),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Personal"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Business"),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          ListView(children: <Widget>[
            Container(
              height: 50,
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
              margin: EdgeInsets.all(15),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PayeeAdd()),
                  );
                },
                elevation: 0.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        'Add new payee',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0),
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
              margin: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  RadioListTile<SingingCharacter>(
                    title: const Text('Janne'),
                    subtitle: Text('34545-3453-34'),
                    value: SingingCharacter.lafayette,
                    groupValue: _character,
                    onChanged: (SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                  RadioListTile<SingingCharacter>(
                    title: const Text('Thomas'),
                    subtitle: Text('34547-1287-34'),
                    value: SingingCharacter.jefferson,
                    groupValue: _character,
                    onChanged: ((SingingCharacter value) {
                      setState(() {
                        _character = value;
                      });
                    }),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: EdgeInsets.only(top: 0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(0),
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //           color: Color(0x10000000),
            //           blurRadius: 0,
            //           spreadRadius: 0,
            //           offset: Offset(2.0, 2.0))
            //     ],
            //   ),
            //   margin: EdgeInsets.all(15),
            // ),
            // ListView(
            //   children: <Widget>[
            //     Container(
            //       child: Text('What sort of payment is this'),
            //     ),
            //     Container(
            //       child: RadioListTile<SingingCharacter>(
            //         title: const Text('Janne'),
            //         subtitle: Text('34545-3453-34'),
            //         value: SingingCharacter.lafayette,
            //         groupValue: _character,
            //         onChanged: (SingingCharacter value) {
            //           setState(() {
            //             _character = value;
            //           });
            //         },
            //       ),
            //     ),
            //   ],
            // ),
          ]),
          //########### Business Start
          ListView(children: <Widget>[
            Container(
              height: 50,
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
              margin: EdgeInsets.all(15),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PayeeAdd()),
                  );
                },
                elevation: 0.0,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Text(
                        'Add new payee',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}

void setState(Null Function() param0) {}
