import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';
import '/imports/components.dart';
import '/data/data.dart';
import '/core/core.dart';

showSeasonDetails({
  required BuildContext context,
  required int tvshowId,
  required int seasonNumber,
}) {
  final seasonRepository = SeasonRepository(http.Client());

  final Future<(Season, http.Response)> getSeason = seasonRepository.getSeason(
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
            future: getSeason,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              }

              var (Season season, _) = snapshot.data!;

              if (snapshot.hasError || season.episodes == null) {
                return const ErrorBlock();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ModalHeader(
                    title: "Season details",
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ProjectColors(context).line,
                          width: 1,
                        ),
                      ),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
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
                        const SizedBox(width: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 110,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                season.name!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ProjectColors(context).title,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                (season.airDate ?? '').formatDateTime(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                "Episodes: ${season.episodes!.length}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      shrinkWrap: true,
                      itemCount: season.episodes!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Episode episode = season.episodes![index];

                        return EpisodeListTile(episode: episode);
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
