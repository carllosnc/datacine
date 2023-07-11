import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:datacine/data/data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:datacine/domain/domain.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test('check trending movie', () async {
    final trendingRepository = TrendingRepository(http.Client());
    final response = await trendingRepository.getMovies(page: 1);
    final movies = MediaList.fromJson(jsonDecode(response.body));

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('check trending tv shows', () async {
    final trendingRepository = TrendingRepository(http.Client());
    final response = await trendingRepository.tv(page: 1);
    final tvShows = MediaList.fromJson(jsonDecode(response.body));

    expect(tvShows.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('check trending people', () async {
    final trendingRepository = TrendingRepository(http.Client());
    final response = await trendingRepository.getPeople(page: 1);

    final people = PersonList.fromJson(jsonDecode(response.body));

    expect(people.results, isA<List<PersonItem>>());
    expect(response.statusCode, 200);
  });

  //test trendings
  test('check trending all', () async {
    final trendingRepository = TrendingRepository(http.Client());

    final items = await trendingRepository.getTrendings();

    expect(items['movies'], isA<List<MediaItem?>?>());
    expect(items['tvshows'], isA<List<MediaItem?>?>());
    expect(items['people'], isA<List<PersonItem>>());

    expect(items['movies'].length, 39);
    expect(items['tvshows'].length, 39);
    expect(items['people'].length, 20);
  });
}
