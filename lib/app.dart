import 'package:flutter/material.dart';
import '/core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'SFProDisplay',
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF0BFF6D),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
