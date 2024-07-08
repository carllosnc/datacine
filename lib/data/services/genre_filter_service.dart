import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports.dart';

mixin GenreFilterService<T extends StatefulWidget> on State<T> {
  final genresRepository = MediaGenreRepository(
    http.Client(),
  );

  late Future<(List<Genre>, http.Response)> getMovieGenres;

  bool isLoading = true;
  bool isError = false;
  List<Genre> genres = [];

  fetchGenre(MediaType mediaType) async {
    try {
      var (mediaGenres, _) = await genresRepository.getGenres(
        mediaType: mediaType,
      );

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
}
