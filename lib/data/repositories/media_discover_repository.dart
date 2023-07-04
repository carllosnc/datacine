import 'dart:convert';
import './repository.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';
import '/notifiers/notifiers.dart';

class MediaDiscoverRepository extends Repository {
  MediaDiscoverRepository(super.httpClient);

  Future<(MediaList, http.Response)> discoverMovies({
    required Filter filter,
    required int page,
  }) async {
    Map<String, String> query = {
      "include_adult": "false",
      "page": "$page",
    };

    print(filter);

    if (filter.genres != null) {
      query.addAll({"with_genres": filter.genres!});
    }

    if (filter.years != null) {
      query.addAll({"primary_release_year": filter.years!});
    }

    if (filter.lang != null) {
      query.addAll({"with_original_language": filter.lang!});
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
    required Filter filter,
    required int page,
  }) async {
    Map<String, String> query = {
      "include_adult": "false",
      "page": "$page",
    };

    if (filter.genres != null) {
      query.addAll({"with_genres": filter.genres!});
    }

    if (filter.years != null) {
      query.addAll({"first_air_date_year": filter.years!});
    }

    if (filter.lang != null) {
      query.addAll({"with_original_language": filter.lang!});
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
