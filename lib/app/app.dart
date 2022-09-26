import 'package:flutter/material.dart';

import '../home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        fontFamily: "Product Sans",
        scaffoldBackgroundColor: const Color(0xffE1E8EC),
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.5),
          centerTitle: true,
        ),
      ),
    );
  }
}
