import 'dart:convert';

import 'package:http/http.dart' as http;
import './repository.dart';
import '/domain/domain.dart';

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
}
