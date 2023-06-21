import 'package:flutter/material.dart';
import 'package:ds1/ds1.dart';
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
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(
                  color: ProjectColors(context).text,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
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

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10,
                children: [
                  DS1Text(
                    (movie?.releaseDate ?? tvshow?.firstAirDate ?? '').formatDateTime(),
                    fontSize: 12,
                    fontColor: ProjectColors(context).label,
                  ),
                  if (tvshow?.lastAirDate != null)
                    DS1Text(
                      "―",
                      fontSize: 12,
                      fontColor: ProjectColors(context).label,
                    ),
                  if (tvshow?.lastAirDate != null)
                    DS1Text(
                      (tvshow?.lastAirDate ?? '').formatDateTime(),
                      fontSize: 12,
                      fontColor: ProjectColors(context).label,
                    ),
                ],
              ),
              const SizedBox(height: 2),
              DS1Text(
                (movie?.title ?? tvshow?.name)!,
                fontSize: 22,
                fontColor: ProjectColors(context).title,
              ),
              const SizedBox(height: 15),
              MovieDirectors(credits: movie?.credits),
              TvShowCreators(creators: tvshow?.createdBy),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MediaTrailer(
                    videos: (movie?.videos?['results'] ?? tvshow?.videos?['results']),
                  ),
                  MediaVotes(
                    voteAverage: (movie?.voteAverage ?? tvshow?.voteAverage),
                    voteCount: (movie?.voteCount ?? tvshow?.voteCount),
                    status: (movie?.status ?? tvshow?.status),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
