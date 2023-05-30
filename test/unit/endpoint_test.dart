import 'package:flutter_test/flutter_test.dart';
import 'package:giganoid_app/data/data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() {
  setUp(() async {
    await dotenv.load(fileName: ".env");
  });

  test('Check movies home repository', () async {
    final movieRepository = MovieRepository();
    final result = await movieRepository.homeMovies(page: 1);

    expect(result.statusCode, 200);
  });
}
