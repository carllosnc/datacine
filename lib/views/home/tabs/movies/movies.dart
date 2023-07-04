import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/data/data.dart';
import '/core/core.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/notifiers/notifiers.dart';

class MoviesTab extends StatefulWidget {
  const MoviesTab({super.key});

  @override
  State<MoviesTab> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab>
    with AutomaticKeepAliveClientMixin<MoviesTab> {
  FilterNotifier filtersState = FilterNotifier();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return ValueListenableBuilder(
      valueListenable: filtersState.movieFilters,
      builder: (context, value, child) {
        var randomKey = Random().nextInt(1000);

        // get data from api using filters
        Future<MediaList> getData({required int page}) async {
          var mediaDiscoverRepository = MediaDiscoverRepository(
            http.Client(),
          );

          var (discovered, _) = await mediaDiscoverRepository.discoverMovies(
            page: page,
            filter: value,
          );

          return discovered;
        }

        return MediaInfinityGrid(
          key: ValueKey(randomKey),
          mediaType: MediaType.movie,
          fetchData: getData,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
