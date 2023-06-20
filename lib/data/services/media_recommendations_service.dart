import 'dart:convert';

import 'package:giganoid_app/domain/domain.dart';
import 'package:http/http.dart' as http;
import '/data/data.dart';
import '/core/core.dart';

class MediaRecommendationService {
  final MediaRecommendationsRepository _mediaRecommendationsRepository =
      MediaRecommendationsRepository(http.Client());

  Future<MediaList> get({
    required int mediaId,
    required int page,
    required MediaType mediaType,
  }) async {
    final response = await _mediaRecommendationsRepository.getRecommendations(
      mediaId: mediaId,
      mediaType: mediaType,
      page: page,
    );

    return MediaList.fromJson(jsonDecode(response.body));
  }
}
