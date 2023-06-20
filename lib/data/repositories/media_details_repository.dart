import 'package:http/http.dart' as http;
import './repository.dart';

class MediaDetailsRepository extends Repository {
  MediaDetailsRepository(super.httpClient);

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

  Future<http.Response> getTvShowDetails({required String id}) async {
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

    return await httpClient.get(
      endpoint(
        path: "tv/$id",
        query: {
          "append_to_response": itemsToAppend,
          "include_adult": "false",
        },
      ),
      headers: headers,
    );
  }
}
