import 'package:flutter/material.dart';
import '/core/core.dart';
import '/components/components.dart';
import '/domain/domain.dart';

class MediaHeader extends StatelessWidget {
  final MovieDetails? movie;
  final TvShowDetails? tvshow;

  const MediaHeader({super.key, this.movie, this.tvshow});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = width * 1.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Image
        Center(
          child: SizedBox(
            width: width,
            height: height,
            child: ImageComponent(
              imagePath: (movie?.posterPath ?? tvshow?.posterPath),
              imageType: ImageType.poster,
              imageSize: ImageSize.posterW500,
            ),
          ),
        ),

        const SizedBox(height: 30),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 10,
                children: [
                  Text(
                    (movie?.releaseDate ?? tvshow?.firstAirDate ?? '')
                        .formatDateTime(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  if (tvshow?.lastAirDate != null)
                    const Text(
                      "―",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  if (tvshow?.lastAirDate != null)
                    Text(
                      (tvshow?.lastAirDate ?? '').formatDateTime(),
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BigTitle(text: (movie?.title ?? tvshow?.name)!),
            ),
            const SizedBox(height: 25),
            MovieDirectors(credits: movie?.credits),
            TvShowCreators(creators: tvshow?.createdBy),
            const SectionDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediaTrailer(
                    videos: (movie?.videos?['results'] ??
                        tvshow?.videos?['results']),
                  ),
                  MediaVotes(
                    voteAverage: (movie?.voteAverage ?? tvshow?.voteAverage),
                    voteCount: (movie?.voteCount ?? tvshow?.voteCount),
                    status: (movie?.status ?? tvshow?.status),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
