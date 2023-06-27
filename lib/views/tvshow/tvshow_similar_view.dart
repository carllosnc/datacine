import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;

class TvShowSimilarView extends StatelessWidget {
  final TvShowDetails tvshow;

  const TvShowSimilarView({
    super.key,
    required this.tvshow,
  });

  Future<MediaList> getData({required int page}) async {
    final mediaSimilarService = MediaSimilarRepository(
      http.Client(),
    );

    // ignore: unused_local_variable
    final (similar, response) = await mediaSimilarService.getSimilar(
      mediaId: tvshow.id as int,
      mediaType: MediaType.tv,
      page: page,
    );

    return similar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Similar',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: MediaInfinityGrid(
        pageTitle: 'Similar',
        mediaType: MediaType.tv,
        fetchData: getData,
      ),
    );
  }
}
