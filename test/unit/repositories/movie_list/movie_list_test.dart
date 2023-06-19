import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mockito/annotations.dart';
import 'package:giganoid_app/domain/domain.dart';
import 'package:giganoid_app/data/data.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test('Check now playing movies', () async {
    final movieRepository = MovieLists(http.Client());
    final reponse = await movieRepository.nowPlayingMoviesData(page: 1);
    final movies = movieRepository.adapt(reponse);

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(reponse.statusCode, 200);
  });

  test('Check popular movies', () async {
    final movieRepository = MovieLists(http.Client());
    final reponse = await movieRepository.popularMoviesData(page: 1);
    final movies = movieRepository.adapt(reponse);

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(reponse.statusCode, 200);
  });

  test('Check top rated movies', () async {
    final movieRepository = MovieLists(http.Client());
    final reponse = await movieRepository.topRatedMoviesData(page: 1);
    final movies = movieRepository.adapt(reponse);

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(reponse.statusCode, 200);
  });

  test('Check upcomming movies', () async {
    final movieRepository = MovieLists(http.Client());
    final reponse = await movieRepository.upcomingMoviesData(page: 1);
    final movies = movieRepository.adapt(reponse);

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(reponse.statusCode, 200);
  });
}
