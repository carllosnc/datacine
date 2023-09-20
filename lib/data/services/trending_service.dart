import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/imports/app.dart';

mixin TrendingsService<T extends StatefulWidget> on State<T> {
  bool isLoading = true;
  bool isError = false;

  late MediaItem featuredMovie;
  late MediaItem featuredTvShow;
  late List<MediaItem> movies;
  late List<MediaItem> tvShows;

  fetchTrendings() async {
    try {
      var result = await TrendingRepository(http.Client()).getTrendings();

      setState(() {
        isLoading = false;

        featuredMovie = result['featuredMovie'];
        featuredTvShow = result['featuredTvshow'];
        movies = result['movies'];
        tvShows = result['tvshows'];
      });
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }
}
