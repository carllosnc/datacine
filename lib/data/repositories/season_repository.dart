import 'package:http/http.dart' as http;
import './repository.dart';

class SeasonRepository extends Repository {
  SeasonRepository(super.httpClient);

  Future<http.Response> getSeason({
    required int tvshowId,
    required int seasonNumber,
  }) async {
    String itemsToAppend = [
      "episodes",
      "credits",
      "images",
    ].join(",");

    return await httpClient.get(
      endpoint(
        path: "tv/$tvshowId/season/$seasonNumber",
        query: {
          "include_adult": "false",
          "append_to_response": itemsToAppend,
        },
      ),
      headers: headers,
    );
  }
}
