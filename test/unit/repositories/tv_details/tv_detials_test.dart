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

  test("Check tv show", () async {
    final tvShowDetailsRepository = TvShowDetailsRepository(http.Client());
    final response = await tvShowDetailsRepository.getTvShowDetails(id: "1399");
    final tvShowDetails = tvShowDetailsRepository.adapt(response);

    expect(tvShowDetails.name, "Game of Thrones");
    expect(tvShowDetails, isA<TvShowDetails>());
    expect(response.statusCode, 200);
  });

  test("Check another tv show", () async {
    final tvShowDetailsRepository = TvShowDetailsRepository(http.Client());
    final response =
        await tvShowDetailsRepository.getTvShowDetails(id: "60735");
    final tvShowDetails = tvShowDetailsRepository.adapt(response);

    expect(tvShowDetails.name, "The Flash");
    expect(tvShowDetails, isA<TvShowDetails>());
    expect(response.statusCode, 200);
  });

  test("Check another tv show", () async {
    final tvShowDetailsRepository = TvShowDetailsRepository(http.Client());
    final response =
        await tvShowDetailsRepository.getTvShowDetails(id: "124364");
    final tvShowDetails = tvShowDetailsRepository.adapt(response);

    expect(tvShowDetails.name, "From");
    expect(tvShowDetails, isA<TvShowDetails>());
    expect(response.statusCode, 200);
  });
}
