import 'dart:convert';
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

  test('check now playing movies', () async {
    final movieRepository = MovieLists(http.Client());
    final response = await movieRepository.nowPlayingMoviesData(page: 1);
    final movies = MediaList.fromJson(jsonDecode(response.body));

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('check popular movies', () async {
    final movieRepository = MovieLists(http.Client());
    final response = await movieRepository.popularMoviesData(page: 1);
    final movies = MediaList.fromJson(jsonDecode(response.body));

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('check top rated movies', () async {
    final movieRepository = MovieLists(http.Client());
    final response = await movieRepository.topRatedMoviesData(page: 1);
    final movies = MediaList.fromJson(jsonDecode(response.body));

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('check upcomming movies', () async {
    final movieRepository = MovieLists(http.Client());
    final response = await movieRepository.upcomingMoviesData(page: 1);
    final movies = MediaList.fromJson(jsonDecode(response.body));

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });
}
