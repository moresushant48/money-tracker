import 'package:flutter/material.dart';
import 'package:money_tracker/screens/phone_auth/repo/phone_auth_repo.dart';

class SplashScreen extends StatefulWidget {
  static const route = "/splash";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkRoutes();
  }

  checkRoutes() async {
    if (await PhoneAuthRepo().isLoggedIn()) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, "/");
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, "/auth");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Text(
          "Money Tracker",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
