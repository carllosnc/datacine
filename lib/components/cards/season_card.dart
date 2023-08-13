import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/imports/components.dart';
import '/core/core.dart';

class SeasonCard extends StatelessWidget {
  final int tvshowId;
  final Season season;

  const SeasonCard({
    super.key,
    required this.season,
    required this.tvshowId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showSeasonDetails(
                context: context,
                tvshowId: tvshowId,
                seasonNumber: season.seasonNumber!,
              );
            },
            child: SizedBox(
              height: 150 * 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: ImageComponent(
                  imagePath: season.posterPath,
                  imageType: ImageType.poster,
                  imageSize: ImageSize.posterW342,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                (season.airDate ?? '').formatDateTime(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  color: ProjectColors(context).label,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                season.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.2,
                  fontSize: 14,
                  color: ProjectColors(context).featured,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
