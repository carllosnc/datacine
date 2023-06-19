import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class TvShowRecommendationView extends StatelessWidget {
  final TvShowDetails tvshow;

  const TvShowRecommendationView({
    super.key,
    required this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    return MediaRecommendationsInfinityGrid(
      mediaType: MediaType.tv,
      id: tvshow.id as int,
    );
  }
}
