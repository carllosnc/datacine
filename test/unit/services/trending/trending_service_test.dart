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

  test('Check trending service', () async {
    final TrendingService trendingService = TrendingService();
    final items = await trendingService.getTrendings();

    expect(items['movies'], isA<List<MediaItem?>?>());
    expect(items['tvshows'], isA<List<MediaItem?>?>());
    expect(items['people'], isA<List<PeopleItem>>());

    expect(items['movies'].length, 36);
    expect(items['tvshows'].length, 36);
    expect(items['people'].length, 20);
  });
}
