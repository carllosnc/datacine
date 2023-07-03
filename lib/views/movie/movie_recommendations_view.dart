import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;

class MovieRecommendationView extends StatelessWidget {
  final MovieDetails movie;

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
        title: const Text(
          'Recommendations',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: MediaInfinityGrid(
        mediaType: MediaType.movie,
        fetchData: fetchData,
      ),
    );
  }
}
