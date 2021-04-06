import 'dart:io';

import 'package:easymoney/screens/dashboard_page.dart';
import 'package:easymoney/screens/pay/pay.dart';
import 'package:easymoney/screens/support/help.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'invoice/invoice.dart';
import 'nav_more.dart';

class Applayout extends StatefulWidget {
  final BuildContext menuScreenContext;

  Applayout({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _ApplayoutState createState() => _ApplayoutState();
}

class _ApplayoutState extends State<Applayout> {
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      DashboardPagen(
        menuScreenContext: widget.menuScreenContext,
      ),
      Invoice(
        menuScreenContext: widget.menuScreenContext,
      ),
      Pays(
        menuScreenContext: widget.menuScreenContext,
      ),
      Helps(
        menuScreenContext: widget.menuScreenContext,
      ),
      Navmore(
        menuScreenContext: widget.menuScreenContext,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: 'Account',
        icon: Icon(Icons.home),
        activeColor: Colors.white,
        inactiveColor: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        title: 'Statement',
        icon: Icon(Icons.list_alt),
        activeColor: Colors.white,
        inactiveColor: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        title: 'Pay & Transfer',
        icon: Icon(Icons.euro_symbol), //£
        activeColor: Colors.white,
        inactiveColor: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        title: 'Help',
        icon: Icon(Icons.live_help_outlined),
        activeColor: Colors.white,
        inactiveColor: Colors.white70,
      ),
      PersistentBottomNavBarItem(
        title: 'More',
        icon: Icon(Icons.more_horiz_outlined),
        activeColor: Colors.white,
        inactiveColor: Colors.white70,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.blue[800],
      body: SafeArea(
        child: PersistentTabView(
          controller: _controller,
          screens: _buildScreens(),
          confineInSafeArea: true,
          itemCount: 5,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          hideNavigationBar: _hideNavBar,
          decoration: NavBarDecoration(
              colorBehindNavBar: Colors.white,
              borderRadius: BorderRadius.circular(20.0)),
          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties: ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          customWidget: CustomNavBarWidget(
            items: _navBarsItems(),
            onItemSelected: (index) {
              setState(() {
                _controller.index =
                    index; // THIS IS CRITICAL!! Don't miss it!
              });
            },
            selectedIndex: _controller.index,
          ),
          navBarStyle: NavBarStyle
              .custom, // Choose the nav bar style with this property
        ),
      ),
    );
  }

  Widget _getBody() {
    return FutureBuilder<bool>(
      future: _doLocalAuth(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(strokeWidth: 5),
            );
          default:
            return PersistentTabView(
              controller: _controller,
              screens: _buildScreens(),
              confineInSafeArea: true,
              itemCount: 5,
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset: true,
              stateManagement: true,
              hideNavigationBarWhenKeyboardShows: true,
              hideNavigationBar: _hideNavBar,
              decoration: NavBarDecoration(
                  colorBehindNavBar: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              popAllScreensOnTapOfSelectedTab: true,
              itemAnimationProperties: ItemAnimationProperties(
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              customWidget: CustomNavBarWidget(
                items: _navBarsItems(),
                onItemSelected: (index) {
                  setState(() {
                    _controller.index =
                        index; // THIS IS CRITICAL!! Don't miss it!
                  });
                },
                selectedIndex: _controller.index,
              ),
              navBarStyle: NavBarStyle
                  .custom, // Choose the nav bar style with this property
            );
        }
      },
    );
  }

  Future<bool> _doLocalAuth() async {
    bool canCheckBiometrics = false;

    if (Platform.isIOS || Platform.isAndroid) {
      var localAuth = LocalAuthentication();
      try {
        canCheckBiometrics = await localAuth.canCheckBiometrics;
        if (canCheckBiometrics) {
          bool didAuthenticate = await localAuth.authenticateWithBiometrics(
              localizedReason: 'Please authenticate',
              useErrorDialogs: false,
              stickyAuth: true);

          print("SR_TAG: didAuthenticate $didAuthenticate");
        }
      } catch (e) {
        print(e);
        canCheckBiometrics = false;
      }
    }
    print("SR_TAG: canCheckBiometrics $canCheckBiometrics");

    return canCheckBiometrics;
  }
}

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;

  CustomNavBarWidget({
    Key key,
    this.selectedIndex,
    @required this.items,
    this.onItemSelected,
  });

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      height: kBottomNavigationBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Flexible(
            child: IconTheme(
              data: IconThemeData(
                  size: 22.0,
                  color: isSelected
                      ? (item.activeContentColor == null
                          ? item.activeColor
                          : item.activeContentColor)
                      : item.inactiveColor == null
                          ? item.activeColor
                          : item.inactiveColor),
              child: item.icon,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                  child: Text(
                item.title,
                style: TextStyle(
                    color: isSelected
                        ? (item.activeContentColor == null
                            ? item.activeColor
                            : item.activeContentColor)
                        : item.inactiveColor,
                    fontWeight: FontWeight.w400,
                    fontSize: item.titleFontSize),
              )),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[800],
      child: Container(
        width: double.infinity,
        height: kBottomNavigationBarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            var index = items.indexOf(item);
            return Flexible(
              child: GestureDetector(
                onTap: () {
                  this.onItemSelected(index);
                },
                child: _buildItem(item, selectedIndex == index),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
/*
PersistentTabView(
        controller: _controller,
        screens: _buildScreens(),
        confineInSafeArea: true,
        itemCount: 5,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.white,
            borderRadius: BorderRadius.circular(20.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        customWidget: CustomNavBarWidget(
          items: _navBarsItems(),
          onItemSelected: (index) {
            setState(() {
              _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
            });
          },
          selectedIndex: _controller.index,
        ),
        navBarStyle:
            NavBarStyle.custom, // Choose the nav bar style with this property
      )
*/
