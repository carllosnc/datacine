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
              direction: Axis.vertical,
              spacing: 10,
              runSpacing: 10,
              children: [
                if (movie!.tagline != null && movie!.tagline!.isNotEmpty)
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      '"${movie?.tagline}"',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ProjectColors(context).featured,
                      ),
                    ),
                  ),
                if (movie!.overview != null && movie!.overview!.isNotEmpty)
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      '${movie?.overview}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: ProjectColors(context).text,
                      ),
                    ),
                  ),
              ],
            ),
          if (tvshow != null)
            Wrap(
              runSpacing: 10,
              children: [
                if (tvshow!.tagline != null && tvshow!.tagline!.isNotEmpty)
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      '"${tvshow?.tagline}"',
                      style: TextStyle(
                        fontSize: 16,
                        color: ProjectColors(context).featured,
                      ),
                    ),
                  ),
                if (tvshow!.overview != null && tvshow!.overview!.isNotEmpty)
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      '${tvshow?.overview}',
                      style: TextStyle(
                        fontSize: 16,
                        color: ProjectColors(context).text,
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
