import 'package:flutter_test/flutter_test.dart';
import 'package:datacine/data/data.dart';
import 'package:datacine/domain/domain.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
import 'package:http/http.dart' as http;

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test('check person details', () async {
    final personDetailsRepository = PersonDetailsRepository(http.Client());
    final (person, response) =
        await personDetailsRepository.getPerson(id: '64');

    expect(person, isA<PersonDetails?>());
    expect(response.statusCode, 200);
  });
}
