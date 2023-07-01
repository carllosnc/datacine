import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/data/data.dart';
import '/core/core.dart';
import '/domain/domain.dart';
import '/components/components.dart';

class MoviesTab extends StatefulWidget {
  const MoviesTab({super.key});

  @override
  State<MoviesTab> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  @override
  Widget build(BuildContext context) {
    Future<MediaList> getData({required int page}) async {
      final mediaDiscoverRepository = MediaDiscoverRepository(
        http.Client(),
      );

      // ignore: unused_local_variable
      final (similar, response) = await mediaDiscoverRepository.discover(
        mediaType: MediaType.movie,
        page: page,
        filters: {},
      );

      return similar;
    }

    return MediaInfinityGrid(
      pageTitle: 'Movies',
      mediaType: MediaType.movie,
      fetchData: getData,
    );
  }
}
