import 'package:giganoid_app/core/core.dart';
import 'package:giganoid_app/domain/domain.dart';
import 'package:giganoid_app/data/data.dart';
import 'package:giganoid_app/notifiers/notifiers.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test("check discover movies", () async {
    final discoverRepository = MediaDiscoverRepository(
      http.Client(),
    );

    var filter = Filter(
      years: "2020",
      genres: "28",
      lang: "en",
    );

    final (movies, response) =
        await discoverRepository.discoverMovies(filter: filter, page: 1);

    expect(response.statusCode, 200);
    expect(movies, isA<MediaList>());
  });

  test("check discover tv shows", () async {
    final discoverRepository = MediaDiscoverRepository(
      http.Client(),
    );

    var filter = Filter(
      years: "2020",
      genres: "28",
      lang: "en",
    );

    final (tvShows, response) =
        await discoverRepository.discoverTvShows(filter: filter, page: 1);

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
