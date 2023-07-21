import 'package:flutter/material.dart';
import '/core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelStyle: TextStyle(
            fontSize: 14,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 14,
          ),
        ),
        fontFamily: 'SFProDisplay',
        useMaterial3: true,
        colorSchemeSeed: ProjectColors(context).randomColor(),
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
