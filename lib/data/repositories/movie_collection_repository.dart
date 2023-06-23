import 'dart:convert';
import 'package:http/http.dart' as http;
import './repository.dart';
import '/domain/domain.dart';

class MovieCollectionRepository extends Repository {
  MovieCollectionRepository(super.httpClient);

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

  Future<Collection> collection(String id) async {
    final response = await getCollection(id: id);
    return Collection.fromJson(jsonDecode(response.body));
  }
}
