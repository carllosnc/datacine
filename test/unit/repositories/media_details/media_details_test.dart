import 'dart:convert';
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
    final response = await mediaDetailsRepository.getMovieDetails(id: "550");
    final movieDetails = MovieDetails.fromJson(jsonDecode(response.body));

    expect(movieDetails.title, "Fight Club");
    expect(movieDetails, isA<MovieDetails>());
    expect(response.statusCode, 200);
  });

  test('Check another movie details', () async {
    final mediaDetailsRepository = MediaDetailsRepository(http.Client());
    final response = await mediaDetailsRepository.getMovieDetails(id: "806704");
    final movieDetails = MovieDetails.fromJson(jsonDecode(response.body));

    expect(movieDetails.title, "The Batman - Part II");
    expect(movieDetails, isA<MovieDetails>());
    expect(response.statusCode, 200);
  });

  test("Check tv show", () async {
    final mediaDetailsRepository = MediaDetailsRepository(http.Client());
    final response = await mediaDetailsRepository.getTvShowDetails(id: "1399");
    final tvShowDetails = TvShowDetails.fromJson(jsonDecode(response.body));

    expect(tvShowDetails.name, "Game of Thrones");
    expect(tvShowDetails, isA<TvShowDetails>());
    expect(response.statusCode, 200);
  });

  test("Check another tv show", () async {
    final mediaDetailsRepository = MediaDetailsRepository(http.Client());
    final response = await mediaDetailsRepository.getTvShowDetails(id: "60735");
    final tvShowDetails = TvShowDetails.fromJson(jsonDecode(response.body));

    expect(tvShowDetails.name, "The Flash");
    expect(tvShowDetails, isA<TvShowDetails>());
    expect(response.statusCode, 200);
  });

  test("Check another tv show", () async {
    final mediaDetailsRepository = MediaDetailsRepository(http.Client());
    final response =
        await mediaDetailsRepository.getTvShowDetails(id: "124364");
    final tvShowDetails = TvShowDetails.fromJson(jsonDecode(response.body));

    expect(tvShowDetails.name, "From");
    expect(tvShowDetails, isA<TvShowDetails>());
    expect(response.statusCode, 200);
  });
}
