import 'dart:convert';
import 'repository.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';

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

    final responseTvshows1 = await tv(page: 1);
    final responseTvshows2 = await tv(page: 2);
    final responseTvshows3 = await tv(page: 3);

    final reponsePeople = await getPeople(page: 1);

    final movies1 = MediaList.fromJson(jsonDecode(responseMoviesPage1.body));
    final movies2 = MediaList.fromJson(jsonDecode(responseMoviesPage2.body));
    final movies3 = MediaList.fromJson(jsonDecode(responseMoviesPage3.body));

    final tvshows1 = MediaList.fromJson(jsonDecode(responseTvshows1.body));
    final tvshows2 = MediaList.fromJson(jsonDecode(responseTvshows2.body));
    final tvshows3 = MediaList.fromJson(jsonDecode(responseTvshows3.body));

    final people = PersonList.fromJson(jsonDecode(reponsePeople.body));

    movies1.results?.shuffle();
    movies2.results?.shuffle();
    movies3.results?.shuffle();

    tvshows1.results?.shuffle();
    tvshows2.results?.shuffle();
    tvshows3.results?.shuffle();

    final featuredMovie = movies1.results?.take(1).toList()[0];
    final featuredTvshow = tvshows1.results?.take(1).toList()[0];

    movies1.results?.removeRange(0, 1);
    tvshows1.results?.removeRange(0, 1);

    movies3.results
        ?.removeRange(movies3.results!.length - 2, movies3.results!.length);
    tvshows3.results
        ?.removeRange(tvshows3.results!.length - 2, tvshows3.results!.length);

    return {
      'featuredMovie': featuredMovie,
      'featuredTvshow': featuredTvshow,
      'movies': movies1.results! + movies2.results! + movies3.results!,
      'tvshows': tvshows1.results! + tvshows2.results! + tvshows3.results!,
      'people': people.results,
    };
  }
}
