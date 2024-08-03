import 'package:datacine/imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

void main() {
  setUpAll(() async {
    await dotenv.load(fileName: ".env");
  });

  test('Check movie details', () async {
    final client = http.Client();
    final repository = MediaDetailsRepository(client);
    final (movieDetails, response) = await repository.getMovie(id: "667538");

    expect(response.statusCode, 200);
    expect(movieDetails, isA<MovieDetails>());
  });

  test('Check tv show details', () async {
    final client = http.Client();
    final repository = MediaDetailsRepository(client);
    final (tvShowDetails, response) = await repository.getTvShow(id: "44217");

    expect(response.statusCode, 200);
    expect(tvShowDetails, isA<TvShowDetails>());
  });
}
