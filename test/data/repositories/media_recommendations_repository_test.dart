import 'package:datacine/imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test("check movie recommendations", () async {
    final recommendationsRepository = MediaRecommendationsRepository(
      http.Client(),
    );

    final (recommendations, response) = await recommendationsRepository.getRecommendations(
      mediaType: MediaType.movie,
      mediaId: 385687,
      page: 1,
    );

    expect(response.statusCode, 200);
    expect(recommendations.page, 1);
    expect(recommendations.results, isA<List<MediaItem?>?>());
  });

  test("check tv show recommendations", () async {
    final recommendationsRepository = MediaRecommendationsRepository(
      http.Client(),
    );

    final (recommendations, response) = await recommendationsRepository.getRecommendations(
      mediaType: MediaType.tv,
      mediaId: 85271,
      page: 1,
    );

    expect(response.statusCode, 200);
    expect(recommendations.page, 1);
    expect(recommendations.results, isA<List<MediaItem?>?>());
  });
}
