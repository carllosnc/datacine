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

  test('Check search results', () async {
    SearchRepository searchRepository = SearchRepository(http.Client());

    final (searchResult, response) =
        await searchRepository.getSugestions(query: "tarantino", page: 1);

    expect(response.statusCode, 200);

    for (var result in searchResult.results!) {
      result is MediaItem
          ? expect(result, isA<MediaItem>())
          : expect(result, isA<PersonItem>());
    }
  });
}
