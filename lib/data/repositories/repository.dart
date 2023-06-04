import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Repository {
  static final String? token = dotenv.env['TMDB_AUTH_TOKEN_V4'];

  final String baseUrl = "api.themoviedb.org";

  final Map<String, String> headers = {
    'Content-Type': 'application/json;charset=utf-8',
    'Authorization': "Bearer $token",
  };

  final http.Client httpClient;

  Repository(this.httpClient);

  Uri endpoint({required String path, Map<String, dynamic>? query}) {
    Map<String, dynamic> defaultQuery = {
      'include_adult': 'false',
    };

    defaultQuery.addAll(query ?? {});

    return Uri.https(baseUrl, '/3/$path', defaultQuery);
  }
}
