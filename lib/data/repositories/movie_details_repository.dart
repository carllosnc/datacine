import 'dart:convert';
import './repository.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';

class MovieDetailsRepository extends Repository {
  MovieDetailsRepository(super.httpClient);

  Future<http.Response> getMovieDetails({required String id}) async {
    String itemsToAppend = [
      "images",
      "videos",
      "alternative_titles",
      "credits",
      "recommendations",
      "similar",
      "keywords",
      "external_ids",
      "release_dates",
      "reviews",
    ].join(",");

    return await httpClient.get(
      endpoint(
        path: "movie/$id",
        query: {
          "append_to_response": itemsToAppend,
          "include_adult": "false",
        },
      ),
      headers: headers,
    );
  }

  MovieDetails adapt(http.Response response) {
    return MovieDetails.fromJson(jsonDecode(response.body));
  }
}
