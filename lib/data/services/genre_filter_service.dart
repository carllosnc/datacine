import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports.dart';

mixin GenreFilterService<T extends StatefulWidget> on State<T> {
  final genresRepository = MediaGenreRepository(
    http.Client(),
  );

  late Future<(List<Genre>, http.Response)> getMovieGenres;

  final FilterNotifier filterNotifier = FilterNotifier();
  bool isLoading = true;
  bool isError = false;
  List<num> filteredGenres = [];
  List<Genre> genres = [];

  fetchGenre(MediaType mediaType) async {
    dynamic currentFilters = "";

    try {
      var (mediaGenres, _) = await genresRepository.getGenres(
        mediaType: mediaType,
      );

      // set current filters to list
      if (mediaType == MediaType.movie) {
        currentFilters = filterNotifier.movieFilters.value.genres;
      }

      // set current filters to list
      if (mediaType == MediaType.tv) {
        currentFilters = filterNotifier.tvShowFilters.value.genres;
      }

      // set filters to list if not null
      if (currentFilters != null) {
        currentFilters.split(',').forEach((element) {
          filteredGenres.add(num.parse(element));
        });
      }

      setState(() {
        genres = mediaGenres;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isError = true;
      });
    }
  }

  // set genres to filter list and remove if unselected
  setGenres(Genre genre, bool value) {
    setState(() {
      if (value) {
        filteredGenres.add(genre.id!);
      } else {
        filteredGenres.remove(genre.id!);
      }
    });
  }
}
