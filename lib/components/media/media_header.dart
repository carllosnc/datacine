import 'package:flutter/material.dart';
import 'package:imgy/imgy.dart';
import 'package:vw/vw.dart';
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
    var hasMovie = movie != null;
    var hasTvShow = tvshow != null;
    var mediaTitle = movie?.title ?? tvshow?.name ?? 'No name';
    var mediaVoteAverage = movie?.voteAverage ?? tvshow?.voteAverage;
    var mediaVoteCount = movie?.voteCount ?? tvshow?.voteCount;
    var mediaStatus = movie?.status ?? tvshow?.status;
    var mediaTrailer = movie?.trailer ?? tvshow?.trailer;

    //cover
    var coverWidth = MediaQuery.of(context).size.width;
    var coverHeight = coverWidth * 1.5;
    var mediaPoster = movie?.poster ?? tvshow?.poster;

    //date
    var date = movie?.releaseDate ?? tvshow?.date ?? 'Unknown date';

    String imageSrc = ImageHelper.getPoster(
      path: mediaPoster,
      size: ImageSize.posterW780,
    );

    return VWColumn(
      gap: 20,
      children: [
        Stack(
          children: [
            Positioned(
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    mediaPoster == null ? AppColors.imageFilter : Colors.transparent,
                    BlendMode.color,
                  ),
                  child: Imgy(
                    borderColor: Colors.white.withOpacity(0.2),
                    width: coverWidth,
                    height: coverHeight,
                    src: imageSrc,
                    placeholderColor: Colors.black,
                    fullSrc: imageSrc,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 70,
              left: 20,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Material(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const SizedBox(
                      width: 50,
                      height: 35,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        VWColumn(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          gap: 5,
          children: [
            SmallText(text: date),
            BigTitle(text: mediaTitle),
            if (hasMovie && movie!.hasGenres) Label(text: movie!.genres),
            if (hasTvShow && tvshow!.hasGenres) Label(text: tvshow!.genres),
          ],
        ),
        VWRow(
          horizontalAlignment: MainAxisAlignment.spaceBetween,
          verticalAlignment: CrossAxisAlignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            MediaVotes(
              voteAverage: (mediaVoteAverage),
              voteCount: (mediaVoteCount),
              status: (mediaStatus),
            ),
            MediaTrailer(
              trailer: (mediaTrailer),
            ),
          ],
        ),
      ],
    );
  }
}
