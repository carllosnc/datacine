import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:datacine/imports.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test('check search results', () async {
    SearchRepository searchRepository = SearchRepository(http.Client());

    final (searchResult, response) =
        await searchRepository.getSuggestions(query: "tarantino", page: 1);

    expect(response.statusCode, 200);

    for (var result in searchResult.results!) {
      result is MediaItem
          ? expect(result, isA<MediaItem>())
          : expect(result, isA<PersonItem>());
    }
  });

  test('check search movies', () async {
    SearchRepository searchRepository = SearchRepository(http.Client());

    final (mediaList, response) = await searchRepository.searchMovies(
      query: "batman",
      page: 1,
    );

    expect(response.statusCode, 200);
    expect(mediaList.results, isA<List<MediaItem>>());
  });

  test('check search tv shows', () async {
    SearchRepository searchRepository = SearchRepository(http.Client());

    final (mediaList, response) = await searchRepository.searchTvShows(
      query: "batman",
      page: 1,
    );

    expect(response.statusCode, 200);
    expect(mediaList.results, isA<List<MediaItem>>());
  });
}
