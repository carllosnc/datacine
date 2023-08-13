import '/dto/dto.dart';
import 'package:flutter/material.dart';
import '/core/core.dart';
import '/imports/components.dart';

class MediaHeader extends StatelessWidget {
  final MovieDto? movie;
  final TvShowDto? tvshow;

  const MediaHeader({super.key, this.movie, this.tvshow});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 40;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 20,
        direction: Axis.vertical,
        children: [
          mediaCover(context),
          Wrap(
            direction: Axis.vertical,
            spacing: 3,
            children: [
              mediaDate(),
              SizedBox(
                width: width,
                child: BigTitle(text: (movie?.title ?? tvshow?.name)!),
              ),
              if (movie != null && movie!.hasGenres)
                Text(
                  movie!.genres,
                  style: TextStyle(
                    fontSize: 14,
                    color: ProjectColors(context).label,
                  ),
                ),
              if (tvshow != null && tvshow!.hasGenres)
                Text(
                  tvshow!.genres,
                  style: TextStyle(
                    fontSize: 14,
                    color: ProjectColors(context).label,
                  ),
                ),
            ],
          ),
          SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MediaTrailer(
                  videos: (movie?.videos ?? tvshow?.videos),
                ),
                MediaVotes(
                  voteAverage: (movie?.voteAverage ?? tvshow?.voteAverage),
                  voteCount: (movie?.voteCount ?? tvshow?.voteCount),
                  status: (movie?.status ?? tvshow?.status),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Center mediaCover(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 40;
    var height = width * 1.5;

    return Center(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white.withOpacity(0.4),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ImageComponent(
            imagePath: (movie?.poster ?? tvshow?.poster),
            imageType: ImageType.poster,
            imageSize: ImageSize.posterW500,
          ),
        ),
      ),
    );
  }

  Widget mediaDate() {
    return Text(
      (movie?.releaseDate ?? tvshow?.date ?? '―'),
      style: const TextStyle(
        fontSize: 12,
      ),
    );
  }
}
