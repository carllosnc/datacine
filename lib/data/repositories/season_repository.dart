import 'dart:convert';
import 'package:http/http.dart' as http;
import './repository.dart';
import '/imports.dart';

class SeasonRepository extends Repository {
  SeasonRepository(super.httpClient);

  Future<(Season, http.Response)> getSeason({
    required int tvshowId,
    required int seasonNumber,
  }) async {
    String itemsToAppend = [
      "episodes",
      "credits",
      "images",
    ].join(",");

    var response = await httpClient.get(
      endpoint(
        path: "tv/$tvshowId/season/$seasonNumber",
        query: {
          "include_adult": "false",
          "append_to_response": itemsToAppend,
        },
      ),
      headers: headers,
    );

    var season = Season.fromJson(jsonDecode(response.body));

    return (season, response);
  }
}
