import 'package:flutter/material.dart';

class FilterNotifier {
  static final FilterNotifier _singleton = FilterNotifier._internal();

  factory FilterNotifier() {
    return _singleton;
  }

  FilterNotifier._internal();

  ValueNotifier<Map<String, dynamic>> movieFilters = ValueNotifier({});
  ValueNotifier<Map<String, dynamic>> tvShowFilters = ValueNotifier({});
}
