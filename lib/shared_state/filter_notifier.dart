import 'package:flutter/material.dart';

class Filter {
  dynamic years;
  dynamic genres;
  dynamic lang;

  Filter({
    this.years,
    this.genres,
    this.lang,
  });

  Filter copyWith({
    dynamic years,
    dynamic genres,
    dynamic lang,
  }) {
    return Filter(
      years: years ?? this.years,
      genres: genres ?? this.genres,
      lang: lang ?? this.lang,
    );
  }
}

class FilterNotifier {
  static final FilterNotifier _singleton = FilterNotifier._internal();

  factory FilterNotifier() {
    return _singleton;
  }

  FilterNotifier._internal();

  ValueNotifier<Filter> movieFilters = ValueNotifier(Filter());
  ValueNotifier<Filter> tvShowFilters = ValueNotifier(Filter());
}
