import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/app.dart';
import '/imports/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // lock orientation to portrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // load dotenv
  await dotenv.load(fileName: ".env");

  // load shared preferences
  await SharedPrefs().loadPreferences();

  // load shorebird
  await ShoreBird().loadShoreBird();

  runApp(const App());
}
