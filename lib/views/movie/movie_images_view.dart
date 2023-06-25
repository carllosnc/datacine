import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';

class MovieImagesView extends StatelessWidget {
  final MovieDetails movie;

  const MovieImagesView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return MediaPosterGrid(images: movie.images);
  }
}
