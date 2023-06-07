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
                  color: Colors.white,
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

        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DS1Text(
                DateHelper.format((movie?.releaseDate ?? tvshow?.firstAirDate)),
                fontSize: 14,
                fontColor: Colors.yellow,
              ),
              const SizedBox(height: 2),
              DS1Text((movie?.title ?? tvshow?.name)!, fontSize: 18),
              const SizedBox(height: 15),
              if (movie != null) MediaDirectors(credits: movie?.credits),
              TvShowCreators(creators: tvshow?.createdBy),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DS1Button(
                    label: "Watch Trailer",
                    icon: Icons.play_arrow,
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

        const Divider(height: 1)
      ],
    );
  }
}
