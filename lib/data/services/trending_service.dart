import '/data/data.dart';
import 'package:http/http.dart' as http;

class TrendingService {
  final TrendingRepository _trendingRepository = TrendingRepository(
    http.Client(),
  );

  Future<dynamic> getTrendings() async {
    final responseMoviesPage1 = await _trendingRepository.movies(page: 1);
    final responseMoviesPage2 = await _trendingRepository.movies(page: 2);

    final responseTvshows1 = await _trendingRepository.tv(page: 1);
    final responseTvshows2 = await _trendingRepository.tv(page: 2);

    final reponsePeople = await _trendingRepository.people(page: 1);

    final movies1 = _trendingRepository.adapt(responseMoviesPage1);
    final movies2 = _trendingRepository.adapt(responseMoviesPage2);

    final tvshows1 = _trendingRepository.adapt(responseTvshows1);
    final tvshows2 = _trendingRepository.adapt(responseTvshows2);

    final people = _trendingRepository.adaptForPeople(reponsePeople);

    final featuredMovies = movies1.results?.take(4).toList();
    final featuredTvshows = tvshows1.results?.take(4).toList();

    movies1.results?.removeRange(0, 4);
    tvshows1.results?.removeRange(0, 4);

    return {
      'featuredMovies': featuredMovies,
      'featuredTvshows': featuredTvshows,
      'movies': movies1.results! + movies2.results!,
      'tvshows': tvshows1.results! + tvshows2.results!,
      'people': people.results,
    };
  }
}
