import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/notifiers/notifiers.dart';
import 'package:http/http.dart' as http;
import '/data/data.dart';
import '/core/core.dart';

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
        // get data from api using filters
        Future<MediaList> getData({required int page}) async {
          var mediaDiscoverRepository = MediaDiscoverRepository(
            http.Client(),
          );

          // ignore: unused_local_variable
          var (discovered, response) =
              await mediaDiscoverRepository.discoverTvShows(
            page: page,
            filters: value,
          );

          return discovered;
        }

        return MediaInfinityGrid(
          key: ValueKey(value.toString()),
          mediaType: MediaType.tv,
          fetchData: getData,
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
