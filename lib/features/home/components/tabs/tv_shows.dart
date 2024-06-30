import 'dart:math';

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
    with AutomaticKeepAliveClientMixin<TVShowsTab> {
  FilterNotifier filtersState = FilterNotifier();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ValueListenableBuilder(
      valueListenable: filtersState.tvShowFilters,
      builder: (context, value, child) {
        var randomKey = Random().nextInt(100000);

        // get data from api using filters
        Future<MediaList> getData({required int page}) async {
          var mediaDiscoverRepository = MediaDiscoverRepository(
            http.Client(),
          );

          var (discovered, _) = await mediaDiscoverRepository.discoverTvShows(
            page: page,
            filter: value,
          );

          return discovered;
        }

        return GridMediaInfinity(
          key: ValueKey(randomKey),
          mediaType: MediaType.tv,
          fetchData: getData,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
