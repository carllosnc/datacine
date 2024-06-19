import 'dart:convert';
import 'repository.dart';
import 'package:http/http.dart' as http;
import '/imports.dart';

class TrendingRepository extends Repository {
  TrendingRepository(super.httpClient);

  Future<http.Response> getMovies({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "trending/movie/week",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> tv({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "trending/tv/week",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<http.Response> getPeople({required int page}) async {
    return await httpClient.get(
      endpoint(
        path: "trending/person/week",
        query: {"page": "$page"},
      ),
      headers: headers,
    );
  }

  Future<(PersonList, http.Response)> getCelebs({required int page}) async {
    var response = await httpClient.get(
      endpoint(
        path: "trending/person/week",
        query: {"page": "$page"},
      ),
      headers: headers,
    );

    var personList = PersonList.fromJson(jsonDecode(response.body));

    return (personList, response);
  }

  Future<dynamic> getTrendings() async {
    final responseMoviesPage1 = await getMovies(page: 1);
    final responseMoviesPage2 = await getMovies(page: 2);
    final responseMoviesPage3 = await getMovies(page: 3);
    final responseMoviesPage4 = await getMovies(page: 4);

    final responseTvshows1 = await tv(page: 1);
    final responseTvshows2 = await tv(page: 2);
    final responseTvshows3 = await tv(page: 3);
    final responseTvshows4 = await tv(page: 4);

    final reponsePeople = await getPeople(page: 1);

    final movies1 = MediaList.fromJson(jsonDecode(responseMoviesPage1.body));
    final movies2 = MediaList.fromJson(jsonDecode(responseMoviesPage2.body));
    final movies3 = MediaList.fromJson(jsonDecode(responseMoviesPage3.body));
    final movies4 = MediaList.fromJson(jsonDecode(responseMoviesPage4.body));

    final tvshows1 = MediaList.fromJson(jsonDecode(responseTvshows1.body));
    final tvshows2 = MediaList.fromJson(jsonDecode(responseTvshows2.body));
    final tvshows3 = MediaList.fromJson(jsonDecode(responseTvshows3.body));
    final tvshows4 = MediaList.fromJson(jsonDecode(responseTvshows4.body));

    final people = PersonList.fromJson(jsonDecode(reponsePeople.body));

    movies1.results?.shuffle();
    movies2.results?.shuffle();
    movies3.results?.shuffle();

    tvshows1.results?.shuffle();
    tvshows2.results?.shuffle();
    tvshows3.results?.shuffle();

    final featuredMovie = movies1.results?.take(1).toList()[0];
    final featuredTvshow = tvshows1.results?.take(1).toList()[0];

    List<MediaItem> totalMovies = movies1.results! + movies2.results! + movies3.results!;
    totalMovies.removeAt(0);

    List<MediaItem> totalTvshows = tvshows1.results! + tvshows2.results! + tvshows3.results!;
    totalTvshows.removeAt(0);

    //fix movie grid
    switch (totalMovies.length) {
      case 59:
        totalMovies.addAll(movies4.results!.take(1).toList());
        break;
      case 58:
        totalMovies.addAll(movies4.results!.take(2).toList());
        break;
      case 2:
        totalMovies.addAll(movies4.results!.take(3).toList());
        break;
      default:
        break;
    }

    //fix tv grid
    switch (totalTvshows.length) {
      case 59:
        totalTvshows.addAll(tvshows4.results!.take(1).toList());
        break;
      case 58:
        totalTvshows.addAll(tvshows4.results!.take(2).toList());
        break;
      case 2:
        totalTvshows.addAll(tvshows4.results!.take(3).toList());
        break;
      default:
        break;
    }

    return {
      'featuredMovie': featuredMovie,
      'featuredTvshow': featuredTvshow,
      'movies': totalMovies,
      'tvshows': totalTvshows,
      'people': people.results,
    };
  }
}
