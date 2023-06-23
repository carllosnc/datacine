import 'dart:convert';

import 'package:http/http.dart' as http;
import './repository.dart';
import '/core/core.dart';
import '/domain/domain.dart';

class MediaRecommendationsRepository extends Repository {
  MediaRecommendationsRepository(super.httpClient);

  Future<http.Response> getRecomendations({
    required int mediaId,
    required int page,
    required MediaType mediaType,
  }) async {
    return await httpClient.get(
      endpoint(
        path: "${mediaType.value}/$mediaId/recommendations",
        query: {
          "include_adult": "false",
          "page": "$page",
        },
      ),
      headers: headers,
    );
  }

  Future<MediaList> recommendations({
    required int mediaId,
    required int page,
    required MediaType mediaType,
  }) async {
    final response = await getRecomendations(
      mediaId: mediaId,
      page: page,
      mediaType: mediaType,
    );

    return MediaList.fromJson(jsonDecode(response.body));
  }
}
