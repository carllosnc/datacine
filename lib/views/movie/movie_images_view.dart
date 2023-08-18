import 'package:flutter/material.dart';
import '/imports/app.dart';

class MovieImagesView extends StatelessWidget {
  final MovieDto movie;

  const MovieImagesView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return MediaPosterGrid(posters: movie.posters, title: movie.title);
  }
}
