import '../repository.dart';
import 'package:http/http.dart' as http;

class MovieRepository extends Repository {
  Future<http.Response> homeMovies({required int page}) async {
    return await http.get(
      endpoint(
        path: "movie/now_playing",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }
}
