import 'package:flutter/material.dart';
import 'package:money_tracker/routes.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.purple),
      initialRoute: "/",
      onGenerateRoute: (settings) => routes(settings),
    );
  }
}
