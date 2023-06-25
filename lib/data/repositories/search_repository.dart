import 'dart:convert';
import 'package:giganoid_app/domain/entities/company_list/company_list.dart';
import 'package:http/http.dart' as http;
import './repository.dart';
import '/domain/domain.dart';
import '/core/core.dart';

class SearchRepository extends Repository {
  SearchRepository(super.httpClient);

  Future<http.Response> getMulti({
    required String query,
    required int page,
  }) async {
    return await httpClient.get(
      endpoint(
        path: "search/multi",
        query: {
          "include_adult": "false",
          "page": "$page",
          "query": query,
        },
      ),
      headers: headers,
    );
  }

  Future<http.Response> searchByType({
    required String query,
    required int page,
    required SearchType type,
  }) async {
    String path = type.value;

    return await httpClient.get(
      endpoint(
        path: "search/$path",
        query: {
          "include_adult": "false",
          "page": "$page",
          "query": query,
        },
      ),
      headers: headers,
    );
  }

  Future<SearchResult> sugestions({
    required String query,
    required int page,
  }) async {
    final response = await getMulti(
      query: query,
      page: page,
    );
    SearchResult searchResult =
        SearchResult.fromJson(jsonDecode(response.body));

    searchResult.results = searchResult.results!.map((element) {
      if (element['media_type'] == 'movie') {
        return MediaItem.fromJson(element);
      } else if (element['media_type'] == 'tv') {
        return MediaItem.fromJson(element);
      } else if (element['media_type'] == 'person') {
        return PersonItem.fromJson(element);
      }
    }).toList();

    return searchResult;
  }

  Future<MediaList> searchMovies({
    required String query,
    required int page,
  }) async {
    final response = await searchByType(
      query: query,
      page: page,
      type: SearchType.movie,
    );

    return MediaList.fromJson(jsonDecode(response.body));
  }

  Future<MediaList> searchTvShows({
    required String query,
    required int page,
  }) async {
    final response = await searchByType(
      query: query,
      page: page,
      type: SearchType.tv,
    );

    return MediaList.fromJson(jsonDecode(response.body));
  }

  Future<PersonList> searchPerson({
    required String query,
    required int page,
  }) async {
    final response = await searchByType(
      query: query,
      page: page,
      type: SearchType.person,
    );

    return PersonList.fromJson(jsonDecode(response.body));
  }

  Future<CompanyList> searchCompany({
    required String query,
    required int page,
  }) async {
    final response = await searchByType(
      query: query,
      page: page,
      type: SearchType.company,
    );

    return CompanyList.fromJson(jsonDecode(response.body));
  }
}
