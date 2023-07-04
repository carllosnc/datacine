import 'dart:convert';
import 'package:http/http.dart' as http;

import './repository.dart';
import '/domain/domain.dart';

class PersonDetailsRepository extends Repository {
  PersonDetailsRepository(super.httpClient);

  Future<(List<Genre>, http.Response)> getGenres({
    required num id,
  }) async {
    var response = await httpClient.get(
      endpoint(
        path: "genre/person/$id",
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
