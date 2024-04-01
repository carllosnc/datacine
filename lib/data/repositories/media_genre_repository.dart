import 'dart:convert';
import 'package:http/http.dart' as http;
import './repository.dart';
import '/imports.dart';

class MediaGenreRepository extends Repository {
  MediaGenreRepository(super.httpClient);

  Future<(List<Genre>, http.Response)> getGenres({
    required MediaType mediaType,
  }) async {
    var response = await httpClient.get(
      endpoint(
        path: "genre/${mediaType.value}/list",
        query: {
          "include_adult": "false",
        },
      ),
      headers: headers,
    );

    var genres = [for (var genre in jsonDecode(response.body)["genres"]) Genre.fromJson(genre)];

    return (genres, response);
  }
}
