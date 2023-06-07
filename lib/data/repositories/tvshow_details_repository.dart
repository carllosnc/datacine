import 'dart:convert';
import './repository.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';

class TvShowDetailsRepository extends Repository {
  TvShowDetailsRepository(super.httpClient);

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

  TvShowDetails adapt(http.Response response) {
    return TvShowDetails.fromJson(jsonDecode(response.body));
  }
}
