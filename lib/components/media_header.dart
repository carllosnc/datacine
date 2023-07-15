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
    var width = MediaQuery.of(context).size.width - 40;
    var height = width * 1.5;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Image
        Center(
          child: SizedBox(
            width: width,
            height: height,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ProjectColors(context).featured,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: ImageComponent(
                  imagePath: (movie?.posterPath ?? tvshow?.posterPath),
                  imageType: ImageType.poster,
                  imageSize: ImageSize.posterW500,
                ),
              ),
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
                    style: TextStyle(
                      fontSize: 12,
                      color: ProjectColors(context).label,
                    ),
                  ),
                  if (tvshow?.lastAirDate != null)
                    Text(
                      "―",
                      style: TextStyle(
                        fontSize: 12,
                        color: ProjectColors(context).label,
                      ),
                    ),
                  if (tvshow?.lastAirDate != null)
                    Text(
                      (tvshow?.lastAirDate ?? '').formatDateTime(),
                      style: TextStyle(
                        fontSize: 12,
                        color: ProjectColors(context).label,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                (movie?.title ?? tvshow?.name)!,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: ProjectColors(context).title,
                ),
              ),
            ),
            const SizedBox(height: 15),
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
