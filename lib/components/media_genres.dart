import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import 'package:giganoid_app/core/constants/colors.dart';
import '/domain/domain.dart';

class MediaGenres extends StatelessWidget {
  final MovieDetails? movie;
  final TvShowDetails? tvshow;

  const MediaGenres({
    super.key,
    this.movie,
    this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    final genres = movie?.genres ?? tvshow?.genres;

    if (genres == null || genres.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 15,
        runSpacing: 15,
        children: [
          Icon(
            Icons.label,
            size: 20,
            color: ProjectColors(context).label,
          ),
          ...genres.map(
            (genre) {
              return DS1Text(
                genre.name!,
                fontColor: ProjectColors(context).link,
                fontSize: 14,
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
