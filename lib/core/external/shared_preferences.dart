import 'package:shared_preferences/shared_preferences.dart';

class _SharedPrefs {
  late final SharedPreferences prefs;

  loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}

var sharedPreferences = _SharedPrefs();
