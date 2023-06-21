import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/data/data.dart';
import '/core/core.dart';

showSeasonDetails({
  required BuildContext context,
  required int tvshowId,
  required int seasonNumber,
}) {
  SeasonService seasonService = SeasonService();

  final seasonFuture = seasonService.getSeason(
    tvshowId: tvshowId,
    seasonNumber: seasonNumber,
  );

  showModalBottomSheet(
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 1,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return FutureBuilder(
            future: seasonFuture,
            builder: (BuildContext context, AsyncSnapshot<Season> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              }

              Season season = snapshot.data!;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BottomSheetHeader(),
                  Container(
                    color: Colors.black.withOpacity(0.25),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Wrap(
                      spacing: 20,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50 * 1.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: ImageComponent(
                              imagePath: season.posterPath,
                              imageType: ImageType.poster,
                              imageSize: ImageSize.posterW342,
                            ),
                          ),
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          spacing: 3,
                          children: [
                            DS1Text(
                              season.name!,
                              fontSize: 12,
                              fontColor: ProjectColors(context).title,
                            ),
                            DS1Text(
                              (season.airDate ?? '').formatDateTime(),
                              fontSize: 12,
                            ),
                            DS1Text(
                              "Episodes: ${season.episodes!.length}",
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: season.episodes!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Episode episode = season.episodes![index];

                        return ListTile(
                          title: DS1Text(
                            episode.name!,
                            fontSize: 14,
                            fontColor: ProjectColors(context).text,
                          ),
                          subtitle: DS1Text(
                            (episode.airDate ?? '').formatDateTime(),
                            fontSize: 12,
                            fontColor: ProjectColors(context).featured,
                          ),
                          leading: DS1Text(
                            episode.episodeNumber.toString(),
                            bold: true,
                            fontSize: 12,
                            fontColor: ProjectColors(context).label,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}
