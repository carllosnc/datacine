import 'package:flutter/material.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

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

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      spacing: 20,
      direction: Axis.vertical,
      children: [
        mediaCover(context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
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
        ),
      ],
    );
  }

  Widget mediaCover(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = width * 1.5;
    var mediaPoster = movie?.poster ?? tvshow?.poster;

    String imageSrc = ImageHelper.getPoster(
      path: mediaPoster,
      size: ImageSize.posterW780,
    );

    return Imgy(
      borderColor: Colors.white.withOpacity(0.2),
      width: width,
      height: height,
      src: imageSrc,
      placeholderColor: Colors.black,
      fullSrc: imageSrc,
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
