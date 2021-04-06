import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const CardScreen({Key key, this.menuScreenContext, this.hideStatus = false})
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
            title: Text("Manage Cards"),
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
            // width: double.infinity,
            child: DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your cards",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 22,
                          ),
                        ),

                        SizedBox(
                          height: 24,
                        ),
                        // Card Container
                        Container(
                          height: 210,
                          margin: EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromRGBO(16, 72, 158, 1),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    radius: 17,
                                    backgroundColor:
                                        Color.fromRGBO(50, 172, 121, 1),
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  Text(
                                    "VISA",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "**** **** **** 2308",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "CARD HOLDER",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue[100],
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                      Text(
                                        "Eric Batista",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[100],
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Expires",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue[100],
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                      Text(
                                        "08/24",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[100],
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "CVV",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.blue[100],
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                      Text(
                                        "815",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey[100],
                                          letterSpacing: 2.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 24,
                        ),

                        Container(
                          child: Text(
                            "Card Settings",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                        ),

                        SizedBox(
                          height: 24,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[100],
                                spreadRadius: 10.0,
                                blurRadius: 4.5,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.wifi_tethering,
                                    color: Colors.lightBlue[900],
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Card Settings",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                value: true,
                                activeColor: Color.fromRGBO(50, 172, 121, 1),
                                onChanged: (_) {},
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[100],
                                spreadRadius: 10.0,
                                blurRadius: 4.5,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          // margin: EdgeInsets.symmetric(
                          //   horizontal: 32,
                          // ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color: Colors.lightBlue[900],
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Online Payment",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                value: true,
                                activeColor: Color.fromRGBO(50, 172, 121, 1),
                                onChanged: (_) {},
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[100],
                                spreadRadius: 10.0,
                                blurRadius: 4.5,
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          // margin: EdgeInsets.symmetric(
                          //   horizontal: 32,
                          // ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.mobile_screen_share,
                                    color: Colors.lightBlue[900],
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "ATM Withdraws",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              Switch(
                                value: true,
                                activeColor: Color.fromRGBO(50, 172, 121, 1),
                                onChanged: (_) {},
                              ),
                            ],
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: ListTile(
                            leading:
                                Icon(Icons.subtitles, color: Colors.blue[900]),
                            title: Text(
                              'Pin',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 18,
                              ),
                            ),
                            trailing: Icon(Icons.navigate_next,
                                color: Colors.blue[900]),
                            onTap: () {
                              Navigator.popAndPushNamed(context, '/card');
                            },
                          ),
                        ),
                        Card(
                          color: Colors.white,
                          margin: EdgeInsets.only(
                            top: 10,
                          ),
                          child: ListTile(
                            leading:
                                Icon(Icons.ac_unit, color: Colors.blue[900]),
                            title: Text(
                              'Freeze',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: 18,
                              ),
                            ),
                            trailing: Icon(Icons.navigate_next,
                                color: Colors.blue[900]),
                            onTap: () {
                              Navigator.popAndPushNamed(context, '/card');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 245, 248, 1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                );
              },
              initialChildSize: 0.95,
              minChildSize: 0.95,
              maxChildSize: 1,
            ),
          ),
        ),
      ),
    );
  }
}
