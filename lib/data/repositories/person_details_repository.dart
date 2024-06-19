import 'dart:convert';
import 'package:http/http.dart' as http;
import './repository.dart';

import '/imports.dart';

class PersonDetailsRepository extends Repository {
  PersonDetailsRepository(super.httpClient);

  Future<(PersonDetails, http.Response)> getPerson({
    required String id,
  }) async {
    String itemsToAppend = [
      "images",
      "movie_credits",
      "tv_credits",
      "combined_credits",
      "tagged_images",
      "external_ids",
    ].join(",");

    var response = await httpClient.get(
      endpoint(
        path: "/person/$id",
        query: {
          "append_to_response": itemsToAppend,
          "include_adult": "false",
        },
      ),
      headers: headers,
    );

    var genres = PersonDetails.fromJson(json.decode(response.body));

    return (genres, response);
  }
}
