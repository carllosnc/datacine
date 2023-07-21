import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';

class MediaInfoGenres extends StatelessWidget {
  final MovieDetails? movie;
  final TvShowDetails? tvshow;

  const MediaInfoGenres({
    super.key,
    this.movie,
    this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    // get the genres from the movie or tv show
    final List<Genre>? genres = movie?.genres ?? tvshow?.genres;

    // if there are no genres, return an empty SizedBox
    if (genres == null || genres.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Genres",
            style: TextStyle(
              fontSize: 14,
              color: ProjectColors(context).label,
            ),
          ),
          const SizedBox(height: 7),
          Text(genres.map((e) => e.name).join(', '))
        ],
      ),
    );
  }
}
