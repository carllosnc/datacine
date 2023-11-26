import 'package:flutter/material.dart';

appTheme(BuildContext context) {
  return ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
    ),
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
    colorSchemeSeed: Colors.red,
    brightness: Brightness.dark,
    //set page navigation animation
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
