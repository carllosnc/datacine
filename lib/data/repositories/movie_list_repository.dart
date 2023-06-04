import 'dart:convert';
import 'repository.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';

class MovieLists extends Repository {
  MovieLists(super.httpClient);

  Future<http.Response> nowPlayingMoviesData({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "movie/now_playing",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> popularMoviesData({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "movie/popular",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> topRatedMoviesData({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "movie/top_rated",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> upcomingMoviesData({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "movie/upcoming",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  MediaList adapt(http.Response response) {
    return MediaList.fromJson(jsonDecode(response.body));
  }
}
