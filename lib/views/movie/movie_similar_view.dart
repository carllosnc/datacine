import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class MovieSimilarView extends StatelessWidget {
  final MovieDetails movie;

  const MovieSimilarView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return MediaSimilarInfinityGrid(
      mediaType: MediaType.movie,
      id: movie.id as int,
    );
  }
}
