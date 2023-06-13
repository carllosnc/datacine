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
    final collectionRepository = CollectionRepository(http.Client());
    final reponse = await collectionRepository.getCollection(id: "9485");
    final collection = collectionRepository.adapt(reponse);

    expect(reponse.statusCode, 200);
    expect(collection.parts, isA<List<MediaItem?>?>());
  });
}
