import 'repository.dart';
import 'package:http/http.dart' as http;

class TrendingRepository extends Repository {
  TrendingRepository(super.httpClient);

  Future<http.Response> movies({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "trending/movie/week",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> tv({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "trending/tv/week",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> people({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "trending/person/week",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }
}
