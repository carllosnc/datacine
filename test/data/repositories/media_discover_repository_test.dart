import 'package:datacine/imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test("check discover movies", () async {
    final discoverRepository = MediaDiscoverRepository(
      http.Client(),
    );

    final (movies, response) = await discoverRepository.discoverMovies(
      startYear: "2020",
      endYear: "2020",
      genres: "28",
      lang: "en",
      page: 1,
    );

    expect(response.statusCode, 200);
    expect(movies, isA<MediaList>());
  });

  test("check discover tv shows", () async {
    final discoverRepository = MediaDiscoverRepository(
      http.Client(),
    );

    final (tvShows, response) = await discoverRepository.discoverTvShows(
      releaseYear: "2020",
      genre: "28",
      lang: "en",
      page: 1,
    );

    expect(response.statusCode, 200);
    expect(tvShows, isA<MediaList>());
  });

  test("check discover movies by company", () async {
    final discoverRepository = MediaDiscoverRepository(
      http.Client(),
    );

    final (movies, response) = await discoverRepository.discoverMoviesByCompany(
      page: 1,
      companyId: 1,
      mediaType: MediaType.movie,
    );

    expect(response.statusCode, 200);
    expect(movies, isA<MediaList>());
  });

  test("check discover movies by keyword", () async {
    final discoverRepository = MediaDiscoverRepository(
      http.Client(),
    );

    final (movies, response) = await discoverRepository.discoverMoviesByKeyword(
      page: 1,
      keywordId: 3070,
      mediaType: MediaType.movie,
    );

    expect(response.statusCode, 200);
    expect(movies, isA<MediaList>());
  });
}
