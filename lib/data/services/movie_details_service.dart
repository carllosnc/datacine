import 'dart:convert';
import '/data/data.dart';
import '/domain/domain.dart';
import 'package:http/http.dart' as http;

class MediaDetailsService {
  final MediaDetailsRepository _mediaDetailsRepository =
      MediaDetailsRepository(http.Client());

  Future<MovieDetails> getMovie(String id) async {
    final response = await _mediaDetailsRepository.getMovieDetails(id: id);
    return MovieDetails.fromJson(jsonDecode(response.body));
  }

  Future<TvShowDetails> getTVShow(String id) async {
    final response = await _mediaDetailsRepository.getTvShowDetails(id: id);
    return TvShowDetails.fromJson(jsonDecode(response.body));
  }
}
