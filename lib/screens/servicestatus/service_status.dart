import 'package:flutter/material.dart';

class ServiceStatus extends StatelessWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;
  const ServiceStatus(
      {Key key, this.menuScreenContext, this.hideStatus = false})
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
            title: Text("Service Status"),
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
                                    "Internet banking",
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
                                    Icons.mobile_friendly,
                                    color: Colors.lightBlue[900],
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Mobile Banking",
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
                                    Icons.phone,
                                    color: Colors.lightBlue[900],
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Telephone banking",
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
                                    Icons.payments,
                                    color: Colors.lightBlue[900],
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Paypoint banking",
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
