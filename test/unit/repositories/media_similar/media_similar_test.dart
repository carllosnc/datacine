import 'dart:convert';
import 'package:giganoid_app/core/core.dart';
import 'package:giganoid_app/domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:giganoid_app/data/data.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test("Check movie similiar", () async {
    final similarRepository = MediaSimilarRepository(
      http.Client(),
    );

    final response = await similarRepository.getSimilar(
      mediaType: MediaType.movie,
      mediaId: 385687,
      page: 1,
    );

    final similar = MediaList.fromJson(jsonDecode(response.body));

    expect(response.statusCode, 200);
    expect(similar.page, 1);
    expect(similar.results, isA<List<MediaItem?>?>());
  });

  test("Check tv show similar", () async {
    final similarRepository = MediaSimilarRepository(
      http.Client(),
    );

    final response = await similarRepository.getSimilar(
      mediaType: MediaType.tv,
      mediaId: 85271,
      page: 1,
    );

    final similar = MediaList.fromJson(jsonDecode(response.body));

    expect(response.statusCode, 200);
    expect(similar.page, 1);
    expect(similar.results, isA<List<MediaItem?>?>());
  });
}
