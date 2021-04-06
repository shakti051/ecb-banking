import 'package:flutter/material.dart';

class Bottonnav extends StatefulWidget {
  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<Bottonnav> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: _scaffoldKey,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue[500],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.70),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: (index) {
        setState(() {
          var _curIndex = index;
          switch (_curIndex) {
            case 0:
              Navigator.pushNamed(context, '/account');
              break;
            case 1:
              Navigator.pushNamed(context, '/invoice');
              break;
            case 2:
              Navigator.pushNamed(context, '/pay'); //popAndPushNamed
              break;
            case 4:
              Navigator.pushNamed(context, '/nav');
              //_scaffoldKey.currentState.openDrawer();
              //_scaffoldKey.currentState.openEndDrawer();
              break;
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          label: 'Account',
          icon: Icon(Icons.wallet_travel),
        ),
        BottomNavigationBarItem(
          label: 'Invoice',
          icon: Icon(Icons.copy),
        ),
        BottomNavigationBarItem(
          label: 'Pay',
          icon: Icon(Icons.euro_symbol),
        ),
        BottomNavigationBarItem(
          label: 'Support',
          icon: Icon(Icons.message_outlined),
        ),
        BottomNavigationBarItem(
          label: 'More',
          icon: Icon(Icons.list),
        ),
      ],
    );
  }
}
