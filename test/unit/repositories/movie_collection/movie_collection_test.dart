import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:giganoid_app/data/data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mockito/annotations.dart';
import 'package:giganoid_app/domain/domain.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test("Check movie collection", () async {
    final collectionRepository = MovieCollectionRepository(http.Client());
    final response = await collectionRepository.getCollection(id: "9485");
    final collection = Collection.fromJson(jsonDecode(response.body));

    expect(response.statusCode, 200);
    expect(collection.parts, isA<List<MediaItem?>?>());
  });
}
