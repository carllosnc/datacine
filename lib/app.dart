import 'dart:math';
import 'package:flutter/material.dart';
import '/core/core.dart';

class App extends StatelessWidget {
  const App({super.key});

  //method to get random material colors
  static MaterialColor getRandomColor() {
    List<MaterialColor> colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.lightBlue,
      Colors.cyan,
      Colors.teal,
      Colors.green,
      Colors.lightGreen,
      Colors.lime,
      Colors.yellow,
      Colors.amber,
      Colors.orange,
      Colors.deepOrange,
    ];
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: getRandomColor(),
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
