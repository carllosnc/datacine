import 'package:flutter/material.dart';
import '/imports/components.dart';
import '/dto/dto.dart';

class TvShowImagesView extends StatelessWidget {
  final TvShowDto tvshow;

  const TvShowImagesView({
    super.key,
    required this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    return MediaPosterGrid(
      posters: tvshow.posters,
      title: tvshow.name,
    );
  }
}
