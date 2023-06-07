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
    final reponse = await tvShowRepository.airingToday(page: 1);

    final tvs = tvShowRepository.adapt(reponse);

    expect(tvs.results, isA<List<MediaItem?>?>());
    expect(reponse.statusCode, 200);
  });

  test('Check on the air tv show', () async {
    final tvShowRepository = TvShowListRepository(http.Client());
    final reponse = await tvShowRepository.onTheAir(page: 1);

    final tvs = tvShowRepository.adapt(reponse);

    expect(tvs.results, isA<List<MediaItem?>?>());
    expect(reponse.statusCode, 200);
  });

  test('Check popular tv show', () async {
    final tvShowRepository = TvShowListRepository(http.Client());
    final reponse = await tvShowRepository.popular(page: 1);

    final tvs = tvShowRepository.adapt(reponse);

    expect(tvs.results, isA<List<MediaItem?>?>());
    expect(reponse.statusCode, 200);
  });

  test('Check top rated tv show', () async {
    final tvShowRepository = TvShowListRepository(http.Client());
    final reponse = await tvShowRepository.topRated(page: 1);

    final tvs = tvShowRepository.adapt(reponse);

    expect(tvs.results, isA<List<MediaItem?>?>());
    expect(reponse.statusCode, 200);
  });
}
