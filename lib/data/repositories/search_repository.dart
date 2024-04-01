import 'dart:convert';
import 'package:http/http.dart' as http;
import './repository.dart';
import '/imports.dart';

class SearchRepository extends Repository {
  SearchRepository(super.httpClient);

  Future<(SearchResult, http.Response)> getSugestions({
    required String query,
    required int page,
  }) async {
    var response = await httpClient.get(
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

    SearchResult searchResult = SearchResult.fromJson(jsonDecode(response.body));

    searchResult.results = searchResult.results!.map((element) {
      if (element['media_type'] == 'movie') {
        return MediaItem.fromJson(element);
      } else if (element['media_type'] == 'tv') {
        return MediaItem.fromJson(element);
      } else if (element['media_type'] == 'person') {
        return PersonItem.fromJson(element);
      }
    }).toList();

    return (searchResult, response);
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

  Future<(MediaList, http.Response)> searchMovies({
    required String query,
    required int page,
  }) async {
    final response = await searchByType(
      query: query,
      page: page,
      type: SearchType.movie,
    );

    var mediaList = MediaList.fromJson(jsonDecode(response.body));

    return (mediaList, response);
  }

  Future<(MediaList, http.Response)> searchTvShows({
    required String query,
    required int page,
  }) async {
    final response = await searchByType(
      query: query,
      page: page,
      type: SearchType.tv,
    );

    var mediaList = MediaList.fromJson(jsonDecode(response.body));

    return (mediaList, response);
  }

  Future<(PersonList, http.Response)> searchPerson({
    required String query,
    required int page,
  }) async {
    final response = await searchByType(
      query: query,
      page: page,
      type: SearchType.person,
    );

    var peopleList = PersonList.fromJson(jsonDecode(response.body));

    return (peopleList, response);
  }

  Future<(CompanyList, http.Response)> searchCompany({
    required String query,
    required int page,
  }) async {
    final response = await searchByType(
      query: query,
      page: page,
      type: SearchType.company,
    );

    var companyLits = CompanyList.fromJson(jsonDecode(response.body));

    return (companyLits, response);
  }
}
