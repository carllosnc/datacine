import 'package:datacine/imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
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
