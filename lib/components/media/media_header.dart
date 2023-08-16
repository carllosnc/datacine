import '/dto/dto.dart';
import 'package:flutter/material.dart';
import '/core/core.dart';
import '/imports/components.dart';

class MediaHeader extends StatelessWidget {
  final MovieDto? movie;
  final TvShowDto? tvshow;

  const MediaHeader({
    super.key,
    this.movie,
    this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 40;
    var hasMovie = movie != null;
    var hasTvShow = tvshow != null;
    var mediaTitle = movie?.title ?? tvshow?.name ?? 'No name';
    var mediaVoteAverage = movie?.voteAverage ?? tvshow?.voteAverage;
    var mediaVoteCount = movie?.voteCount ?? tvshow?.voteCount;
    var mediaStatus = movie?.status ?? tvshow?.status;
    var mediaTrailer = movie?.trailer ?? tvshow?.trailer;

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
                child: BigTitle(
                  text: (mediaTitle),
                ),
              ),
              if (hasMovie && movie!.hasGenres)
                Text(
                  movie!.genres,
                  style: TextStyle(
                    fontSize: 14,
                    color: ProjectColors(context).label,
                  ),
                ),
              if (hasTvShow && tvshow!.hasGenres)
                SizedBox(
                  width: width,
                  child: Text(
                    tvshow!.genres,
                    style: TextStyle(
                      fontSize: 14,
                      color: ProjectColors(context).label,
                    ),
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
                  trailer: (mediaTrailer),
                ),
                MediaVotes(
                  voteAverage: (mediaVoteAverage),
                  voteCount: (mediaVoteCount),
                  status: (mediaStatus),
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
    var mediaPoster = movie?.poster ?? tvshow?.poster;

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
            imagePath: (mediaPoster),
            imageType: ImageType.poster,
            imageSize: ImageSize.posterW500,
          ),
        ),
      ),
    );
  }

  Widget mediaDate() {
    var date = movie?.releaseDate ?? tvshow?.date ?? 'Unknown date';

    return Text(
      date,
      style: const TextStyle(
        fontSize: 12,
      ),
    );
  }
}
