import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import 'package:giganoid_app/core/constants/colors.dart';
import '/domain/domain.dart';
import 'package:collection/collection.dart';

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
    final List<Genre>? genres = movie?.genres ?? tvshow?.genres;

    if (genres == null || genres.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        children: [
          Icon(
            Icons.label_outline_rounded,
            size: 20,
            color: ProjectColors(context).label,
          ),
          ...genres.mapIndexed(
            (num index, Genre genre) {
              return Wrap(
                spacing: 5,
                children: [
                  DS1Text(
                    genre.name!,
                    fontColor: ProjectColors(context).link,
                    fontSize: 14,
                  ),
                  if (index != genres.length - 1)
                    DS1Text(
                      '•',
                      fontColor: ProjectColors(context).text.withOpacity(0.2),
                    ),
                ],
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
