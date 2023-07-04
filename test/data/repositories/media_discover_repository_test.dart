import 'package:giganoid_app/domain/domain.dart';
import 'package:giganoid_app/data/data.dart';
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

    var filters = {
      "genres": "28",
      "lang": "en",
      "years": "2020",
    };

    final (movies, response) =
        await discoverRepository.discoverMovies(filters: filters, page: 1);

    expect(response.statusCode, 200);
    expect(movies, isA<MediaList>());
  });

  test("check discover tv shows", () async {
    final discoverRepository = MediaDiscoverRepository(
      http.Client(),
    );

    var filters = {
      "genres": "28",
      "lang": "en",
      "years": "2020",
    };

    final (tvShows, response) =
        await discoverRepository.discoverTvShows(filters: filters, page: 1);

    expect(response.statusCode, 200);
    expect(tvShows, isA<MediaList>());
  });
}
