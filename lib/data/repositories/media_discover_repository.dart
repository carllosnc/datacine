import 'dart:convert';
import './repository.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';

class MediaDiscoverRepository extends Repository {
  MediaDiscoverRepository(super.httpClient);

  Future<(MediaList, http.Response)> discoverMovies({
    required Map<String, dynamic> filters,
    required int page,
  }) async {
    Map<String, String> query = {
      "include_adult": "false",
      "page": "$page",
    };

    if (filters["genres"] != null) {
      query.addAll({"with_genres": filters["genres"]!});
    }

    if (filters["years"] != null) {
      query.addAll({"primary_release_year": filters["years"]!});
    }

    if (filters["lang"] != null) {
      query.addAll({"with_original_language": filters["lang"]!});
    }

    var response = await httpClient.get(
      endpoint(
        path: "discover/movie",
        query: query,
      ),
      headers: headers,
    );

    var medialist = MediaList.fromJson(jsonDecode(response.body));

    return (medialist, response);
  }

  Future<(MediaList, http.Response)> discoverTvShows({
    required Map<String, dynamic> filters,
    required int page,
  }) async {
    Map<String, String> query = {
      "include_adult": "false",
      "page": "$page",
    };

    if (filters["genres"] != null) {
      query.addAll({"with_genres": filters["genres"]!});
    }

    if (filters["years"] != null) {
      query.addAll({"first_air_date_year": filters["years"]!});
    }

    if (filters["lang"] != null) {
      query.addAll({"with_original_language": filters["lang"]!});
    }

    var response = await httpClient.get(
      endpoint(
        path: "discover/tv",
        query: query,
      ),
      headers: headers,
    );

    var medialist = MediaList.fromJson(jsonDecode(response.body));

    return (medialist, response);
  }
}
