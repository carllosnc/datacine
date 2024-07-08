import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports.dart';

class MoviesTab extends StatefulWidget {
  const MoviesTab({super.key});

  @override
  State<MoviesTab> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab>
    with AutomaticKeepAliveClientMixin<MoviesTab>, SharedState {
  @override
  Widget build(BuildContext context) {
    var key = ValueKey(
      'movies-${movieFilterState.dateLabel}-${movieFilterState.genre?.id}-${movieFilterState.lang?.iso6391}',
    );

    super.build(context);

    Future<MediaList> getData({required int page}) async {
      var mediaDiscoverRepository = MediaDiscoverRepository(
        http.Client(),
      );

      var (discovered, _) = await mediaDiscoverRepository.discoverMovies(
        page: page,
        startYear: movieFilterState.startDate,
        endYear: movieFilterState.endDate,
        genres: movieFilterState.genre?.id.toString(),
        lang: movieFilterState.lang?.iso6391,
      );

      return discovered;
    }

    return GridMediaInfinity(
      key: key,
      mediaType: MediaType.movie,
      fetchData: getData,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
