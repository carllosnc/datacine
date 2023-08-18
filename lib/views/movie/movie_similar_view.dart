import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports/app.dart';

class MovieSimilarView extends StatelessWidget {
  final MovieDto movie;

  const MovieSimilarView({
    super.key,
    required this.movie,
  });

  Future<MediaList> getData({required int page}) async {
    final mediaSimilarService = MediaSimilarRepository(
      http.Client(),
    );

    final (similar, _) = await mediaSimilarService.getSimilar(
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
        title: PageTitle(
          title: 'Similar',
          subtitle: movie.title,
        ),
      ),
      body: MediaInfinityGrid(
        mediaType: MediaType.movie,
        fetchData: getData,
      ),
    );
  }
}
