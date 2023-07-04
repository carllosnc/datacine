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

  test('check season repository', () async {
    SeasonRepository seasonRepository = SeasonRepository(http.Client());

    final (season, response) = await seasonRepository.getSeason(
      tvshowId: 1399,
      seasonNumber: 1,
    );

    expect(season, isA<Season>());
    expect(season.episodes, isA<List<Episode>>());
    expect(response.statusCode, 200);
  });
}
