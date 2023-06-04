import 'package:flutter_test/flutter_test.dart';
import 'package:giganoid_app/domain/domain.dart';
import 'package:giganoid_app/data/data.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test('Check movie details', () async {
    final movieDetailsRepository = MovieDetailsRepository(http.Client());
    final response = await movieDetailsRepository.getMovieDetails(id: "550");

    final movieDetails = movieDetailsRepository.adapt(response);

    expect(movieDetails.title, "Fight Club");
    expect(movieDetails, isA<MovieDetails>());
    expect(response.statusCode, 200);
  });
}
