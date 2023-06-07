import 'package:flutter_test/flutter_test.dart';
import 'package:giganoid_app/data/data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:giganoid_app/domain/domain.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test('Check trending movie', () async {
    final trendingRepository = TrendingRepository(http.Client());
    final response = await trendingRepository.movies(page: 1);
    final movies = trendingRepository.adapt(response);

    expect(movies.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('Check trending tv shows', () async {
    final trendingRepository = TrendingRepository(http.Client());
    final response = await trendingRepository.tv(page: 1);
    final tvShows = trendingRepository.adapt(response);

    expect(tvShows.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('Check trending people', () async {
    final trendingRepository = TrendingRepository(http.Client());
    final response = await trendingRepository.people(page: 1);

    final people = trendingRepository.adaptForPeople(response);

    expect(people.results, isA<List<PersonItem>>());
    expect(response.statusCode, 200);
  });
}
