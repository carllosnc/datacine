import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
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
      width: 200,
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
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: ProjectColors(context).featured.withOpacity(0.4),
                  width: 1,
                ),
              ),
              height: 200 * 1.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
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
                  color: ProjectColors(context).text,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                season.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
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
