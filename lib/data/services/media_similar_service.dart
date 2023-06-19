import 'package:giganoid_app/domain/domain.dart';
import 'package:http/http.dart' as http;
import '/data/data.dart';
import '/core/core.dart';

class MediaSimilarService {
  final MediaSimilarRepository _mediaSimilarRepository =
      MediaSimilarRepository(http.Client());

  Future<MediaList> get({
    required int mediaId,
    required int page,
    required MediaType mediaType,
  }) async {
    final response = await _mediaSimilarRepository.getSimilar(
      mediaId: mediaId,
      mediaType: mediaType,
      page: page,
    );

    return _mediaSimilarRepository.adapt(response);
  }
}
