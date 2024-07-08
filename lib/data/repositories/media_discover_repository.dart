import 'dart:convert';
import './repository.dart';
import 'package:http/http.dart' as http;
import '/imports.dart';

class MediaDiscoverRepository extends Repository {
  MediaDiscoverRepository(super.httpClient);

  Future<(MediaList, http.Response)> discoverMovies({
    String? startYear,
    String? endYear,
    String? genres,
    String? lang,
    required int page,
  }) async {
    Map<String, String> query = {
      "include_adult": "false",
      "page": "$page",
    };

    if (genres != null) {
      query.addAll({
        "with_genres": genres,
      });
    }

    if (startYear != null) {
      query.addAll({
        "primary_release_date.gte": "$startYear-01-01",
        "primary_release_date.lte": "$endYear-12-31",
      });
    }

    if (lang != null) {
      query.addAll({
        "with_original_language": lang,
      });
    }

    var response = await httpClient.get(
      endpoint(
        path: "discover/movie",
        query: query,
      ),
      headers: headers,
    );

    var mediaList = MediaList.fromJson(jsonDecode(response.body));

    return (mediaList, response);
  }

  Future<(MediaList, http.Response)> discoverTvShows({
    String? genre,
    String? releaseYear,
    String? lang,
    required int page,
  }) async {
    Map<String, String> query = {
      "include_adult": "false",
      "page": "$page",
    };

    if (genre != null) {
      query.addAll({"with_genres": genre});
    }

    if (releaseYear != null) {
      query.addAll({"first_air_date_year": releaseYear});
    }

    if (lang != null) {
      query.addAll({"with_original_language": lang});
    }

    var response = await httpClient.get(
      endpoint(
        path: "discover/tv",
        query: query,
      ),
      headers: headers,
    );

    var mediaList = MediaList.fromJson(jsonDecode(response.body));

    return (mediaList, response);
  }

  Future<(MediaList, http.Response)> discoverMoviesByCompany({
    required int companyId,
    required int page,
    required MediaType mediaType,
  }) async {
    Map<String, String> query = {
      "include_adult": "false",
      "page": "$page",
      "with_companies": "$companyId"
    };

    var response = await httpClient.get(
      endpoint(
        path: "discover/${mediaType.value}",
        query: query,
      ),
      headers: headers,
    );

    var mediaList = MediaList.fromJson(jsonDecode(response.body));

    return (mediaList, response);
  }

  Future<(MediaList, http.Response)> discoverMoviesByKeyword({
    required num keywordId,
    required int page,
    required MediaType mediaType,
  }) async {
    Map<String, String> query = {
      "include_adult": "false",
      "page": "$page",
      "with_keywords": "$keywordId"
    };

    var response = await httpClient.get(
      endpoint(
        path: "discover/${mediaType.value}",
        query: query,
      ),
      headers: headers,
    );

    var mediaList = MediaList.fromJson(jsonDecode(response.body));

    return (mediaList, response);
  }
}
