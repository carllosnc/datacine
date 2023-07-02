import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
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
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var genre in genres)
                LinkButton(
                  onPressed: () {},
                  label: genre.name!,
                )
            ],
          ),
        ],
      ),
    );
  }
}
