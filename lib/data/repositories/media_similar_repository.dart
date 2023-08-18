import 'dart:convert';
import 'package:http/http.dart' as http;
import './repository.dart';

import '/imports/app.dart';

class MediaSimilarRepository extends Repository {
  MediaSimilarRepository(super.httpClient);

  Future<(MediaList, http.Response)> getSimilar({
    required int mediaId,
    required int page,
    required MediaType mediaType,
  }) async {
    var response = await httpClient.get(
      endpoint(
        path: "${mediaType.value}/$mediaId/similar",
        query: {
          "include_adult": "false",
          "page": "$page",
        },
      ),
      headers: headers,
    );

    var similar = MediaList.fromJson(jsonDecode(response.body));

    return (similar, response);
  }
}
