import 'package:flutter/material.dart';
import '/imports.dart';

class _MovieFilterState extends ChangeNotifier {
  String startDate = DateTime.now().year.toString();
  String endDate = DateTime.now().year.toString();
  String dateLabel = DateTime.now().year.toString();
  Genre? genre;
  Language? lang;

  void setYears(
    String startDate,
    String endDate,
    String dateLabel,
  ) {
    this.startDate = startDate;
    this.endDate = endDate;
    this.dateLabel = dateLabel;
    notifyListeners();
  }

  void setGenres(Genre? currentGenre) {
    genre = currentGenre;
    notifyListeners();
  }

  void setLang(Language? lang) {
    this.lang = lang;
    notifyListeners();
  }
}

var movieFilterState = _MovieFilterState();
