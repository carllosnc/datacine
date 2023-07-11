import 'package:datacine/domain/domain.dart';
import 'package:datacine/data/data.dart';
import 'package:datacine/core/core.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test("check movie genres", () async {
    final genresRepository = MediaGenreRepository(
      http.Client(),
    );

    final (genres, response) = await genresRepository.getGenres(
      mediaType: MediaType.movie,
    );

    expect(response.statusCode, 200);
    expect(genres, isA<List<Genre>>());
  });

  test("check tv genres", () async {
    final genresRepository = MediaGenreRepository(
      http.Client(),
    );

    final (genres, response) = await genresRepository.getGenres(
      mediaType: MediaType.tv,
    );

    expect(response.statusCode, 200);
    expect(genres, isA<List<Genre>>());
  });
}
