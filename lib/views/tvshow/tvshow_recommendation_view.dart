import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;

class TvShowRecommendationView extends StatelessWidget {
  final TvShowDetails tvshow;

  const TvShowRecommendationView({
    super.key,
    required this.tvshow,
  });

  Future<MediaList> getData({required int page}) async {
    final mediaRecommendationService = MediaRecommendationsRepository(
      http.Client(),
    );

    // ignore: unused_local_variable
    final (recommendations, respose) =
        await mediaRecommendationService.getRecomendations(
      mediaId: tvshow.id as int,
      mediaType: MediaType.tv,
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
        mediaType: MediaType.tv,
        fetchData: getData,
      ),
    );
  }
}
