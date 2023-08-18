import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports/app.dart';

class TvShowRecommendationView extends StatelessWidget {
  final TvShowDto tvshow;

  const TvShowRecommendationView({
    super.key,
    required this.tvshow,
  });

  Future<MediaList> getData({required int page}) async {
    final mediaRecommendationService = MediaRecommendationsRepository(
      http.Client(),
    );

    final (recommendations, _) =
        await mediaRecommendationService.getRecomendations(
      mediaId: tvshow.id,
      mediaType: MediaType.tv,
      page: page,
    );

    return recommendations;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PageTitle(
          title: 'Recommendations',
          subtitle: tvshow.name,
        ),
      ),
      body: MediaInfinityGrid(
        mediaType: MediaType.tv,
        fetchData: getData,
      ),
    );
  }
}
