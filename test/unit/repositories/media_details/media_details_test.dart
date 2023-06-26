import 'package:flutter_test/flutter_test.dart';
import 'package:giganoid_app/data/data.dart';
import 'package:giganoid_app/domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test('Check movie details', () async {
    final mediaDetailsRepository = MediaDetailsRepository(http.Client());
    final (movie, response) = await mediaDetailsRepository.getMovie(id: "550");

    expect(movie.title, "Fight Club");
    expect(movie, isA<MovieDetails>());
    expect(response.statusCode, 200);
  });

  test('Check another movie details', () async {
    final mediaDetailsRepository = MediaDetailsRepository(http.Client());
    final (movie, response) =
        await mediaDetailsRepository.getMovie(id: "806704");

    expect(movie.title, "The Batman - Part II");
    expect(movie, isA<MovieDetails>());
    expect(response.statusCode, 200);
  });

  test("Check tv show", () async {
    final mediaDetailsRepository = MediaDetailsRepository(http.Client());
    final (tvshow, response) =
        await mediaDetailsRepository.getTvShow(id: "1399");

    expect(tvshow.name, "Game of Thrones");
    expect(tvshow, isA<TvShowDetails>());
    expect(response.statusCode, 200);
  });

  test("Check another tv show", () async {
    final mediaDetailsRepository = MediaDetailsRepository(http.Client());
    final (tvshow, response) =
        await mediaDetailsRepository.getTvShow(id: "60735");

    expect(tvshow.name, "The Flash");
    expect(tvshow, isA<TvShowDetails>());
    expect(response.statusCode, 200);
  });

  test("Check another tv show", () async {
    final mediaDetailsRepository = MediaDetailsRepository(http.Client());
    final (tvshow, response) =
        await mediaDetailsRepository.getTvShow(id: "124364");

    expect(tvshow.name, "From");
    expect(tvshow, isA<TvShowDetails>());
    expect(response.statusCode, 200);
  });
}
