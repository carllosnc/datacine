import 'dart:convert';
import 'package:http/http.dart' as http;
import './repository.dart';

import '/imports/app.dart';

class MovieCollectionRepository extends Repository {
  MovieCollectionRepository(super.httpClient);

  Future<(Collection, http.Response)> getCollection({
    required String id,
  }) async {
    var response = await httpClient.get(
      endpoint(
        path: "collection/$id",
        query: {
          "include_adult": "false",
        },
      ),
      headers: headers,
    );

    var collection = Collection.fromJson(jsonDecode(response.body));

    return (collection, response);
  }
}
