import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vw/vw.dart';

import '/imports.dart';

showMediaRecommendations({
  required BuildContext context,
  MovieDto? movie,
  TvShowDto? tvShow,
  required MediaType mediaType,
}) {
  Future<MediaList> fetchData({required int page}) async {
    final mediaRecommendationService = MediaRecommendationsRepository(
      http.Client(),
    );

    final (recommendations, _) =
        await mediaRecommendationService.getRecommendations(
      mediaId: (movie?.id ?? tvShow?.id) as int,
      mediaType: mediaType,
      page: page,
    );

    return recommendations;
  }

  VWPage.open(
    borderRadius: 0,
    appBar: AppBar(
      title: const FloatPageTitle(text: 'Recommendations'),
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.close),
      ),
    ),
    context: context,
    body: GridMediaInfinity(
      mediaType: mediaType,
      fetchData: fetchData,
    ),
  );
}
