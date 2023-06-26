import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;

class MovieSimilarView extends StatelessWidget {
  final MovieDetails movie;

  const MovieSimilarView({
    super.key,
    required this.movie,
  });

  Future<MediaList> getData({required int page}) async {
    final mediaSimilarService = MediaSimilarRepository(
      http.Client(),
    );

    // ignore: unused_local_variable
    final (similar, response) = await mediaSimilarService.getSimilar(
      mediaId: movie.id as int,
      mediaType: MediaType.movie,
      page: page,
    );

    return similar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DS1Text('Similar', fontSize: 14),
      ),
      body: MediaInfinityGrid(
        pageTitle: 'Similar',
        mediaType: MediaType.movie,
        fetchData: getData,
      ),
    );
  }
}
