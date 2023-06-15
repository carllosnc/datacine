import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';

class MovieImagesView extends StatefulWidget {
  final MovieDetails movie;

  const MovieImagesView({
    super.key,
    required this.movie,
  });

  @override
  State<MovieImagesView> createState() => _MovieImagesViewState();
}

class _MovieImagesViewState extends State<MovieImagesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DS1Text(
          'Posters: ${widget.movie.images!['posters']!.length}',
          fontSize: 14,
        ),
      ),
      //body with page view
      body: MediaPosterGrid(images: widget.movie.images),
    );
  }
}
