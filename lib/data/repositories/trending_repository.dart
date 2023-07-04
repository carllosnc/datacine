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

    final responseTvshows1 = await tv(page: 1);
    final responseTvshows2 = await tv(page: 2);

    final reponsePeople = await getPeople(page: 1);

    final movies1 = MediaList.fromJson(jsonDecode(responseMoviesPage1.body));
    final movies2 = MediaList.fromJson(jsonDecode(responseMoviesPage2.body));

    final tvshows1 = MediaList.fromJson(jsonDecode(responseTvshows1.body));
    final tvshows2 = MediaList.fromJson(jsonDecode(responseTvshows2.body));

    final people = PersonList.fromJson(jsonDecode(reponsePeople.body));

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
