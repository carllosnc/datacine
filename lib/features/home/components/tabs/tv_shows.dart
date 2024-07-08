import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/imports.dart';

class TVShowsTab extends StatefulWidget {
  const TVShowsTab({
    super.key,
  });

  @override
  State<TVShowsTab> createState() => _TVShowsTabState();
}

class _TVShowsTabState extends State<TVShowsTab>
    with AutomaticKeepAliveClientMixin<TVShowsTab>, SharedState {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    var key = ValueKey(
      'tvshows-${tvShowFilterState.releaseYear}-${tvShowFilterState.genre?.id}-${tvShowFilterState.lang?.iso6391}',
    );

    Future<MediaList> getData({required int page}) async {
      var mediaDiscoverRepository = MediaDiscoverRepository(
        http.Client(),
      );

      var (discovered, _) = await mediaDiscoverRepository.discoverTvShows(
        page: page,
        releaseYear: tvShowFilterState.releaseYear,
        genre: tvShowFilterState.genre?.id.toString(),
        lang: tvShowFilterState.lang?.iso6391,
      );

      return discovered;
    }

    return GridMediaInfinity(
      key: key,
      mediaType: MediaType.tv,
      fetchData: getData,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
