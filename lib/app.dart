import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ds1Theme(
        context: context,
        dark: true,
        color: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
