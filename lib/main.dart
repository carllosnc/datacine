import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '/core/core.dart';
import '/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // load dotenv
  await dotenv.load(fileName: ".env");

  // load shared preferences
  await SharedPrefs().loadPreferences();

  //load shorebird
  await ShoreBird().loadShoreBird();

  runApp(const App());
}
