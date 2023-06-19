import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class TvShowSimilarView extends StatelessWidget {
  final TvShowDetails tvshow;

  const TvShowSimilarView({
    super.key,
    required this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    return MediaSimilarInfinityGrid(
      mediaType: MediaType.tv,
      id: tvshow.id as int,
    );
  }
}
