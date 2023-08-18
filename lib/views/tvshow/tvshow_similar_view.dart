import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports/app.dart';

class TvShowSimilarView extends StatelessWidget {
  final TvShowDto tvshow;

  const TvShowSimilarView({
    super.key,
    required this.tvshow,
  });

  Future<MediaList> getData({required int page}) async {
    final mediaSimilarService = MediaSimilarRepository(
      http.Client(),
    );

    final (similar, _) = await mediaSimilarService.getSimilar(
      mediaId: tvshow.id,
      mediaType: MediaType.tv,
      page: page,
    );

    return similar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(title: 'Similar TV Shows', subtitle: tvshow.name),
          ],
        ),
      ),
      body: MediaInfinityGrid(
        mediaType: MediaType.tv,
        fetchData: getData,
      ),
    );
  }
}
