import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:giganoid_app/data/data.dart';
import 'package:giganoid_app/domain/domain.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test('Check now playing tv show', () async {
    final tvShowRepository = TvShowListRepository(http.Client());
    final response = await tvShowRepository.airingToday(page: 1);

    final tvs = MediaList.fromJson(jsonDecode(response.body));

    expect(tvs.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('Check on the air tv show', () async {
    final tvShowRepository = TvShowListRepository(http.Client());
    final response = await tvShowRepository.onTheAir(page: 1);

    final tvs = MediaList.fromJson(jsonDecode(response.body));

    expect(tvs.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('Check popular tv show', () async {
    final tvShowRepository = TvShowListRepository(http.Client());
    final response = await tvShowRepository.popular(page: 1);

    final tvs = MediaList.fromJson(jsonDecode(response.body));

    expect(tvs.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });

  test('Check top rated tv show', () async {
    final tvShowRepository = TvShowListRepository(http.Client());
    final response = await tvShowRepository.topRated(page: 1);

    final tvs = MediaList.fromJson(jsonDecode(response.body));

    expect(tvs.results, isA<List<MediaItem?>?>());
    expect(response.statusCode, 200);
  });
}
