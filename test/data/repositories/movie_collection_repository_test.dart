import 'package:datacine/imports.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test("check movie collection", () async {
    final collectionRepository = MovieCollectionRepository(http.Client());
    final (collection, response) = await collectionRepository.getCollection(id: "9485");

    expect(response.statusCode, 200);
    expect(collection.parts, isA<List<MediaItem?>?>());
  });
}
