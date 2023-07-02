import 'package:flutter/material.dart';

class MovieFilterNotifier {
  static final MovieFilterNotifier _singleton = MovieFilterNotifier._internal();

  factory MovieFilterNotifier() {
    return _singleton;
  }

  MovieFilterNotifier._internal();

  ValueNotifier<Map<String, dynamic>> filters = ValueNotifier({});
}
