import './repository.dart';
import 'package:http/http.dart' as http;

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
}
