import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class MovieRecommendationView extends StatelessWidget {
  final MovieDetails movie;

  const MovieRecommendationView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return MediaRecommendationsInfinityGrid(
      mediaType: MediaType.movie,
      id: movie.id as int,
    );
  }
}
