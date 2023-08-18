import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports/app.dart';

class MovieRecommendationView extends StatelessWidget {
  final MovieDto movie;

  const MovieRecommendationView({
    super.key,
    required this.movie,
  });

  Future<MediaList> fetchData({required int page}) async {
    final mediaRecommendationService = MediaRecommendationsRepository(
      http.Client(),
    );

    final (recommendations, _) =
        await mediaRecommendationService.getRecomendations(
      mediaId: movie.id as int,
      mediaType: MediaType.movie,
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
          subtitle: movie.title,
        ),
      ),
      body: MediaInfinityGrid(
        mediaType: MediaType.movie,
        fetchData: fetchData,
      ),
    );
  }
}
