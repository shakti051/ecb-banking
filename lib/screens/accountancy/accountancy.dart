import 'package:flutter/material.dart';

class Accountancy extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const Accountancy({Key key, this.menuScreenContext, this.hideStatus = false})
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
            title: Text("Accountancy Software"),
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
            height: MediaQuery.of(context).size.height,
            child: ListView(children: <Widget>[
              Card(
                color: Colors.grey[200],
                elevation: 0,
                child: ListTile(
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Coming soon',
                            style: TextStyle(
                                color: Colors.black12,
                                fontSize: 32,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                  onTap: null,
                ),
              ),

              //------------ Card End-------------------//
            ]),
          ),
        ),
      ),
    );
  }
}
