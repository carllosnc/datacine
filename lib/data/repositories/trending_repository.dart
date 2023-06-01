import 'dart:convert';
import 'package:giganoid_app/data/responses/people_list_response.dart';

import 'repository.dart';
import 'package:http/http.dart' as http;
import '/data/data.dart';

class TrendingRepository extends Repository {
  TrendingRepository(super.httpClient);

  Future<http.Response> movies({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "trending/movie/day",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> tv({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "trending/tv/day",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> people({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "trending/person/day",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  MediaListResponse adapt(http.Response response) {
    return MediaListResponse.fromJson(jsonDecode(response.body));
  }

  PeopleListResponse adaptForPeople(http.Response response) {
    return PeopleListResponse.fromJson(jsonDecode(response.body));
  }
}
