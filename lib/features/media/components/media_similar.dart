import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';
import 'package:http/http.dart' as http;

showMediaSimilar({
  required BuildContext context,
  MovieDto? movie,
  TvShowDto? tvShow,
  required MediaType mediaType,
}) {
  Future<MediaList> fetchData({required int page}) async {
    final mediaSimilarService = MediaSimilarRepository(
      http.Client(),
    );

    final (similar, _) = await mediaSimilarService.getSimilar(
      mediaId: (movie?.id ?? tvShow?.id) as int,
      mediaType: mediaType,
      page: page,
    );

    return similar;
  }

  VWPage.open(
    appBar: AppBar(
      title: const FloatPageTitle(text: 'Similar'),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close),
      ),
    ),
    context: context,
    body: MediaInfinityGrid(
      mediaType: mediaType,
      fetchData: fetchData,
    ),
  );
}
