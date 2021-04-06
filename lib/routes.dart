import 'package:easymoney/screens/pay/pay.dart';
import 'package:easymoney/screens/splash_screen.dart';
import 'package:easymoney/screens/transactions/TransactionsScreen.dart';
import 'package:easymoney/screens/account_page.dart';
import 'package:easymoney/screens/cards/card_screen.dart';
import 'package:easymoney/screens/dashboard_page.dart';
import 'package:easymoney/screens/invoice/invoice.dart';
import 'package:easymoney/screens/applayout.dart';
import 'package:easymoney/screens/money_transfer_page.dart';
import 'package:easymoney/screens/profile_page.dart';
import 'package:easymoney/screens/support/support.dart';
import 'package:easymoney/screens/welcome_screen.dart';
import 'package:easymoney/screens/auth/login_screen.dart';
import 'package:easymoney/screens/auth/signup_screen.dart';
import 'kyc/letstart.dart';

//import 'package:shared_preferences/shared_preferences.dart';
//  Future<dynamic> _isalradyLogin() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool isFirstTime = prefs.getBool('_isFirstLogin');
//     if (isFirstTime != null && !isFirstTime) {
//       return false;
//     } else {
//       return true;
//     }
//   }
//   Timer(Duration(seconds: 2), () {
//       _isalradyLogin().then((isFirstTime) {
//         isFirstTime
//             ? print("First time")
//             : Navigator.pushNamed(context, '/login');
//       });
//     });

getRouts() {
  return {
    '/splash': (context) => SplassScreen(),
    '/': (context) => WelcomeScreen(),
    '/letstart': (context) => Letsstart(),
    '/login': (context) => LoginPage(),
    '/signup': (context) => SignupPage(),
    '/home': (context) => Applayout(),
    '/dashboard': (context) => DashboardPagen(),
    '/profile': (context) => ProfilePage(),
    '/account': (context) => AccountPage(),
    '/pay': (context) => MoneyTransferPage(),
    '/card': (context) => CardScreen(),
    '/transactions': (context) => TransactionsScreen(),
    '/invoice': (context) => Invoice(),
    '/support': (context) => Support(),
    '/Pays': (context) => Pays(),
  };
}

// onPressed: () async {
//   var username = _usernameController.text;
//   var password = _passwordController.text;
//   var jwt = await attemptLogIn(username, password);
//   if(jwt != null) {
//     storage.write(key: "jwt", value: jwt);
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => HomePage.fromBase64(jwt)
//       )
//     );
//   } else {
//     displayDialog(context, "An Error Occurred", "No account was found matching that username and password");
//   }
// },
