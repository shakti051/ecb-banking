import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:easymoney/constants/color_constant.dart';
import 'package:easymoney/utils/network_util.dart';
import 'package:easymoney/widgets/alertBox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPagen extends StatefulWidget {
  final BuildContext menuScreenContext;
  final bool hideStatus;

  const DashboardPagen(
      {Key key, this.menuScreenContext, this.hideStatus = false})
      : super(key: key);

  @override
  _DashboardPagenState createState() => _DashboardPagenState();
}

class _DashboardPagenState extends State<DashboardPagen> {
  String _accNumber = "";
  String _accShortcode = "";
  String _accName = "";
  String _balance = "";

  @override
  void initState() {
    super.initState();
    _getAccountInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tap back again to leave'),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            appBar: AppBar(
              backgroundColor: Colors.blue[800],
              // status bar color
              brightness: Brightness.dark,
              title: Text(_accName),
              centerTitle: true,
              leading: Icon(
                Icons.account_circle_outlined,
              ),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications_active_outlined,
                        size: 26.0,
                      ),
                    )),
              ],
            ),
            body: Container(
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.blue[800],
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 0,
                            spreadRadius: 0,
                            offset: Offset(0.0, 4.0))
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 50,
                          right: 20,
                          child: Icon(
                            Icons.account_balance_outlined,
                            color: Colors.white, //The color which you want set.
                            size: 40.0,
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Text(
                            '$_accName Current Account',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 45,
                          child: Text(
                            '$_accShortcode | $_accNumber',
                            style: GoogleFonts.nunito(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          bottom: 25,
                          child: Text(
                            '£ $_balance',
                            style: GoogleFonts.nunito(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Last Transaction Section
                  Container(
                      height: 50,
                      padding: EdgeInsets.only(
                          left: 20, top: 5, bottom: 5, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'March, 2021',
                            style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: kBlackColor,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: IconButton(
                              icon: Icon(
                                Icons.settings_input_component_outlined,
                                color: Colors.blue[800],
                                size: 20.0,
                              ),
                              onPressed: null,
                            ),
                          ),
                        ],
                      )),
                  Container(
                    height: 304,
                    child: Center(
                      child: Text('No transactions yet'),
                    ),
                    /*child: ListView.builder(
                      padding: EdgeInsets.only(left: 0, right: 0),
                      itemCount: wallets.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 1),
                          height: 68,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x04000000),
                                    blurRadius: 10,
                                    spreadRadius: 10,
                                    offset: Offset(0.0, 8.0))
                              ],
                              color: kWhiteColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kWhiteGreyColor,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            wallets[index].walletLogo),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        wallets[index].name,
                                        style: GoogleFonts.nunito(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: kBlackColor),
                                      ),
                                      Text(
                                        wallets[index].wallet,
                                        style: GoogleFonts.nunito(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: kGreyColor),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    wallets[index].walletNumber,
                                    style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: kGreyColor),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),*/
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _getAccountInfo() async {
    try {
      String token = await FlutterSecureStorage().read(key: "_accessToken");
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token',
      };
      postreq('user/accounts', headers, null, context).then((res) {
        print(res);
        if (res['statusCode'] == 200) {
          setState(() {
            _accNumber = res['responce']['data']['accountno'] ?? "";
            _accShortcode = res['responce']['data']['shortcode'] ?? "";
            _balance = res['responce']['data']['balance'] ?? "";
            _accName = res['responce']['data']['details']['name'] ?? "";
          });
        } else {
          AlertBox(res['responce'], "error", context);
        }
      });
    } catch (error) {
      AlertBox(error, "error", context);
    }
  }
}
