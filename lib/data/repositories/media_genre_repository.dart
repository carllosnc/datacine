import 'dart:convert';
import './repository.dart';
import '/domain/domain.dart';
import 'package:http/http.dart' as http;

class MediaGenreRepository extends Repository {
  MediaGenreRepository(super.httpClient);

  Future<(List<Genre>, http.Response)> getMovieGenres() async {
    var response = await httpClient.get(
      endpoint(
        path: "genre/movie/list",
        query: {
          "include_adult": "false",
        },
      ),
      headers: headers,
    );

    var genres = [
      for (var genre in jsonDecode(response.body)["genres"])
        Genre.fromJson(genre)
    ];

    return (genres, response);
  }

  Future<(List<Genre>, http.Response)> getTvGenres() async {
    var response = await httpClient.get(
      endpoint(
        path: "genre/tv/list",
        query: {
          "include_adult": "false",
        },
      ),
      headers: headers,
    );

    var genres = [
      for (var genre in jsonDecode(response.body)["genres"])
        Genre.fromJson(genre)
    ];

    return (genres, response);
  }
}
