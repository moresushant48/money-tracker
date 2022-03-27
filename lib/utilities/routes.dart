import 'package:flutter/material.dart';
import 'package:money_tracker/screens/homepage/homepage.dart';
import 'package:money_tracker/screens/phone_auth/phone_auth.dart';
import 'package:money_tracker/screens/splash_screen/splash_screen.dart';

Route routes(RouteSettings? settings) {
  switch (settings?.name) {
    case "/":
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    case SplashScreen.route:
      return MaterialPageRoute(
        builder: (context) => SplashScreen(),
      );
    case PhoneAuthPage.route:
      return MaterialPageRoute(
        builder: (context) => PhoneAuthPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
  }
}
