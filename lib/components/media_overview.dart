import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/core/core.dart';
import '/domain/domain.dart';

class MediaOverview extends StatelessWidget {
  final MovieDetails? movie;
  final TvShowDetails? tvshow;

  const MediaOverview({
    super.key,
    this.movie,
    this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (movie != null)
            Wrap(
              runSpacing: 10,
              children: [
                Visibility(
                  visible: movie!.tagline != null && movie!.tagline!.isNotEmpty,
                  child: DS1Text(
                    '"${movie?.tagline}"',
                    fontSize: 14,
                    fontColor: Colors.yellow,
                  ),
                ),
                Visibility(
                  visible:
                      movie!.overview != null && movie!.overview!.isNotEmpty,
                  child: DS1Text(
                    '${movie?.overview}',
                    fontSize: 14,
                    fontColor: ProjectColors.text,
                  ),
                ),
              ],
            ),
          if (tvshow != null)
            Wrap(
              runSpacing: 10,
              children: [
                Visibility(
                  visible:
                      tvshow!.tagline != null && tvshow!.tagline!.isNotEmpty,
                  child: DS1Text(
                    '"${tvshow?.tagline}"',
                    fontSize: 14,
                    fontColor: Colors.yellow,
                  ),
                ),
                Visibility(
                  visible:
                      tvshow!.overview != null && tvshow!.overview!.isNotEmpty,
                  child: Opacity(
                    opacity: 0.6,
                    child: DS1Text(
                      '${tvshow?.overview}',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
