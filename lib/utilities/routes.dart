import 'package:flutter/material.dart';
import 'package:money_tracker/screens/homepage/homepage.dart';

Route routes(RouteSettings? settings) {
  switch (settings?.name) {
    case "/":
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => HomePage(),
      );
  }
}
