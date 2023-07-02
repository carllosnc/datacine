import 'dart:convert';
import '/core/core.dart';
import './repository.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';

class MediaDiscoverRepository extends Repository {
  MediaDiscoverRepository(super.httpClient);

  Future<(MediaList, http.Response)> discover({
    required MediaType mediaType,
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
        path: "discover/${mediaType.value}",
        query: query,
      ),
      headers: headers,
    );

    var medialist = MediaList.fromJson(jsonDecode(response.body));

    return (medialist, response);
  }
}
