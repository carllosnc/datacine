import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/app.dart';
import '/imports.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // lock orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // load shared preferences
  await sharedPreferences.loadPreferences();

  runApp(const App());
}
