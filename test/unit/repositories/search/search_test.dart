import 'dart:convert';

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

    final response =
        await searchRepository.getMulti(query: "tarantino", page: 1);
    SearchResult searchResult =
        SearchResult.fromJson(jsonDecode(response.body));

    searchResult.results = searchResult.results!.map((element) {
      if (element['media_type'] == 'movie') {
        return MediaItem.fromJson(element);
      } else if (element['media_type'] == 'tv') {
        return MediaItem.fromJson(element);
      } else if (element['media_type'] == 'person') {
        return PersonItem.fromJson(element);
      }
    }).toList();

    for (var result in searchResult.results!) {
      result is MediaItem
          ? expect(result, isA<MediaItem>())
          : expect(result, isA<PersonItem>());
    }
  });
}
