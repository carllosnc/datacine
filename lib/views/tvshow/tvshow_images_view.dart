import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import 'package:giganoid_app/domain/domain.dart';
import '/components/components.dart';

class TvShowImagesView extends StatefulWidget {
  final TvShowDetails tvshow;

  const TvShowImagesView({super.key, required this.tvshow});

  @override
  State<TvShowImagesView> createState() => _TvShowImagesViewState();
}

class _TvShowImagesViewState extends State<TvShowImagesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DS1Text(
          'Posters: ${widget.tvshow.images!['posters']!.length}',
          fontSize: 14,
        ),
      ),
      body: MediaPosterGrid(images: widget.tvshow.images),
    );
  }
}
