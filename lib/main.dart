import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  debugRepaintRainbowEnabled = true;

  runApp(const App());
}
