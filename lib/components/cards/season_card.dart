import 'package:flutter/material.dart';
import 'package:imgy/imgy.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

class SeasonCard extends StatelessWidget {
  final int tvshowId;
  final Season season;
  final String tvshowName;

  const SeasonCard({
    super.key,
    required this.season,
    required this.tvshowId,
    required this.tvshowName,
  });

  @override
  Widget build(BuildContext context) {
    var poster = ImageHelper.getPoster(
      path: season.posterPath,
      size: ImageSize.posterW342,
    );

    return SizedBox(
      width: 150,
      child: VWColumn(
        gap: 8,
        children: [
          GestureDetector(
            onTap: () {
              showSeasonDetails(
                context: context,
                tvshowId: tvshowId,
                seasonNumber: season.seasonNumber!,
                tvshowName: tvshowName,
              );
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  season.posterPath == null ? AppColors.imageFilter : Colors.transparent,
                  BlendMode.color,
                ),
                child: Imgy(
                  src: poster,
                  fullSrc: poster,
                  borderRadius: BorderRadius.circular(7),
                  width: double.infinity,
                  height: 150 * 1.5,
                  placeholderColor: Colors.black,
                ),
              ),
            ),
          ),
          VWColumn(
            gap: 2,
            children: [
              Text(
                (season.airDate ?? '').formatDateTime(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.label,
                ),
              ),
              Text(
                season.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  height: 1.2,
                  fontSize: 14,
                  color: AppColors.link,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
