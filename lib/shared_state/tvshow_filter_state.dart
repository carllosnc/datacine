import 'package:flutter/cupertino.dart';
import '/imports.dart';

class _TVShowFilterState extends ChangeNotifier {
  String releaseYear = DateTime.now().year.toString();
  Genre? genre;
  Language? lang;

  void setReleaseDate(String newReleaseYear) {
    releaseYear = newReleaseYear;
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

var tvShowFilterState = _TVShowFilterState();
