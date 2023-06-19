import 'dart:convert';
import 'package:http/http.dart' as http;
import './repository.dart';
import '/domain/domain.dart';
import '/core/core.dart';

class MediaSimilarRepository extends Repository {
  MediaSimilarRepository(super.httpClient);

  Future<http.Response> getSimilar({
    required int mediaId,
    required int page,
    required MediaType mediaType,
  }) async {
    return await httpClient.get(
      endpoint(
        path: "${mediaType.value}/$mediaId/similar",
        query: {
          "include_adult": "false",
          "page": "$page",
        },
      ),
      headers: headers,
    );
  }

  MediaList adapt(http.Response response) {
    return MediaList.fromJson(jsonDecode(response.body));
  }
}
