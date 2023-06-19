import 'dart:convert';
import './repository.dart';
import '/domain/domain.dart';
import 'package:http/http.dart' as http;

class CollectionRepository extends Repository {
  CollectionRepository(super.httpClient);

  Future<http.Response> getCollection({required String id}) async {
    return await httpClient.get(
      endpoint(
        path: "collection/$id",
        query: {
          "include_adult": "false",
        },
      ),
      headers: headers,
    );
  }

  Collection adapt(http.Response response) {
    return Collection.fromJson(jsonDecode(response.body));
  }
}
