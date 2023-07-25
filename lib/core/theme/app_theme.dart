import 'package:flutter/material.dart';
import '/core/core.dart';

appTheme(BuildContext context) {
  return ThemeData(
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
  );
}
