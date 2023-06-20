import 'repository.dart';
import 'package:http/http.dart' as http;

class TvShowListRepository extends Repository {
  TvShowListRepository(super.httpClient);

  Future<http.Response> airingToday({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "tv/airing_today",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> onTheAir({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "tv/on_the_air",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> popular({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "tv/popular",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> topRated({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "tv/top_rated",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }
}
