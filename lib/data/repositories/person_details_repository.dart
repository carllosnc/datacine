import 'dart:convert';
import 'package:http/http.dart' as http;

import './repository.dart';
import '/domain/domain.dart';

class PersonDetailsRepository extends Repository {
  PersonDetailsRepository(super.httpClient);

  Future<(PersonDetails, http.Response)> getPerson({
    required String id,
  }) async {
    var response = await httpClient.get(
      endpoint(
        path: "/person/$id",
        query: {
          "include_adult": "false",
        },
      ),
      headers: headers,
    );

    var genres = PersonDetails.fromJson(json.decode(response.body));

    return (genres, response);
  }
}
