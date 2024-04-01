import 'dart:convert';
import 'package:http/http.dart' as http;
import './repository.dart';
import '/imports.dart';

class MediaDetailsRepository extends Repository {
  MediaDetailsRepository(super.httpClient);

  Future<(MovieDetails, http.Response)> getMovie({required String id}) async {
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

    var response = await httpClient.get(
      endpoint(
        path: "movie/$id",
        query: {
          "append_to_response": itemsToAppend,
          "include_adult": "false",
        },
      ),
      headers: headers,
    );

    var movie = MovieDetails.fromJson(jsonDecode(response.body));

    return (movie, response);
  }

  Future<(TvShowDetails, http.Response)> getTvShow({
    required String id,
  }) async {
    String itemsToAppend = [
      "videos",
      "images",
      "aggregate_credits",
      "credits",
      "keywords",
      "recommendations",
      "similar",
      "episode_groups",
      "external_ids",
      "content_ratings",
    ].join(",");

    var response = await httpClient.get(
      endpoint(
        path: "tv/$id",
        query: {
          "append_to_response": itemsToAppend,
          "include_adult": "false",
        },
      ),
      headers: headers,
    );

    var tvShow = TvShowDetails.fromJson(jsonDecode(response.body));

    return (tvShow, response);
  }
}
