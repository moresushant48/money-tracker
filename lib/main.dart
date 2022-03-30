import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/screens/investments/cubit/investment_cubit.dart';
import 'package:money_tracker/screens/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:money_tracker/utilities/routes.dart';
import 'package:money_tracker/screens/homepage/cubit/domain_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DomainCubit()),
          BlocProvider(create: (context) => PhoneAuthCubit()),
          BlocProvider(create: (context) => InvestmentCubit("")),
        ],
        child: MaterialApp(
          themeMode: ThemeMode.light,
          theme: ThemeData(primarySwatch: Colors.purple),
          initialRoute: "/splash",
          onGenerateRoute: (settings) => routes(settings),
        ));
  }
}
