import '/data/data.dart';
import '/domain/domain.dart';
import 'package:http/http.dart' as http;

class MovieDetailsService {
  final MovieDetailsRepository _movieDetailsRepository =
      MovieDetailsRepository(http.Client());

  Future<MovieDetails> getMovie(String id) async {
    final response = await _movieDetailsRepository.getMovieDetails(id: id);
    return _movieDetailsRepository.adapt(response);
  }
}
