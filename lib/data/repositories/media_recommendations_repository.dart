import 'dart:convert';

import 'package:http/http.dart' as http;
import './repository.dart';
import '/core/core.dart';
import '/domain/domain.dart';

class MediaRecommendationsRepository extends Repository {
  MediaRecommendationsRepository(super.httpClient);

  Future<(MediaList, http.Response)> getRecomendations({
    required int mediaId,
    required int page,
    required MediaType mediaType,
  }) async {
    var response = await httpClient.get(
      endpoint(
        path: "${mediaType.value}/$mediaId/recommendations",
        query: {
          "include_adult": "false",
          "page": "$page",
        },
      ),
      headers: headers,
    );

    var recommendations = MediaList.fromJson(jsonDecode(response.body));

    return (recommendations, response);
  }
}
