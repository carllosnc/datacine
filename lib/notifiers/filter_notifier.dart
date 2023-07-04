import 'package:flutter/material.dart';

class FilterNotifier {
  static final FilterNotifier _singleton = FilterNotifier._internal();

  factory FilterNotifier() {
    return _singleton;
  }

  FilterNotifier._internal();

  ValueNotifier<Map<String, dynamic>> movieFilters = ValueNotifier({
    'years': null,
    'genres': null,
    'lang': null,
  });

  ValueNotifier<Map<String, dynamic>> tvShowFilters = ValueNotifier({
    'years': null,
    'genres': null,
    'lang': null,
  });
}
