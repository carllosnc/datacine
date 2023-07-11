import 'package:datacine/core/core.dart';
import 'package:datacine/domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:datacine/data/data.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test("check movie similiar", () async {
    final similarRepository = MediaSimilarRepository(
      http.Client(),
    );

    final (similar, response) = await similarRepository.getSimilar(
      mediaType: MediaType.movie,
      mediaId: 385687,
      page: 1,
    );

    expect(response.statusCode, 200);
    expect(similar.page, 1);
    expect(similar.results, isA<List<MediaItem?>?>());
  });

  test("check tv show similar", () async {
    final similarRepository = MediaSimilarRepository(
      http.Client(),
    );

    final (similar, response) = await similarRepository.getSimilar(
      mediaType: MediaType.tv,
      mediaId: 85271,
      page: 1,
    );

    expect(response.statusCode, 200);
    expect(similar.page, 1);
    expect(similar.results, isA<List<MediaItem?>?>());
  });
}
