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

class _MoviesTabState extends State<MoviesTab> {
  MovieFilterNotifier filtersState = MovieFilterNotifier();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: filtersState.filters,
      builder: (context, value, child) {
        Future<MediaList> getData({required int page}) async {
          var mediaDiscoverRepository = MediaDiscoverRepository(
            http.Client(),
          );

          // ignore: unused_local_variable
          var (similar, response) = await mediaDiscoverRepository.discover(
            mediaType: MediaType.movie,
            page: page,
            filters: value,
          );

          return similar;
        }

        return MediaInfinityGrid(
          key: ValueKey(value.toString()),
          mediaType: MediaType.movie,
          fetchData: getData,
        );
      },
    );
  }
}
