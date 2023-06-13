import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '/components/components.dart';

class TvShowSeasons extends StatelessWidget {
  final TvShowDetails? tvshow;
  final double maxWidth;

  const TvShowSeasons({
    super.key,
    required this.tvshow,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (tvshow == null || tvshow!.seasons == null || tvshow!.seasons!.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Season> seasons = tvshow!.seasons!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DS1Text(
                seasons.length == 1 ? '1 Season' : '${seasons.length} Seasons',
                fontSize: 16,
                fontColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 365,
              width: maxWidth,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 15);
                },
                itemCount: seasons.length,
                itemBuilder: (BuildContext context, int index) {
                  Season season = seasons[index];

                  return SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            //go to season page
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              border: Border.all(
                                color: Colors.transparent,
                                width: 2,
                              ),
                            ),
                            height: 200 * 1.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
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
                              DateHelper.format(season.airDate),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.yellow,
                              ),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              season.name!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
