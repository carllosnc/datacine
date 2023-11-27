import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imgy/imgy.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

showSeasonDetails({
  required BuildContext context,
  required int tvshowId,
  required int seasonNumber,
  required String tvshowName,
}) {
  final seasonRepository = SeasonRepository(http.Client());

  final Future<(Season, http.Response)> getSeason = seasonRepository.getSeason(
    tvshowId: tvshowId,
    seasonNumber: seasonNumber,
  );

  VWPage.open(
    appBar: AppBar(
      title: SectionTitle(text: tvshowName),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.close),
      ),
    ),
    context: context,
    body: FutureBuilder(
      future: getSeason,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        var (Season season, _) = snapshot.data!;

        if (snapshot.hasError || season.episodes == null) {
          return const ErrorBlock();
        }

        var poster = ImageHelper.getPoster(
          path: season.posterPath,
          size: ImageSize.posterW342,
        );

        var posterFull = ImageHelper.getPoster(
          path: season.posterPath,
          size: ImageSize.backdropW1280,
        );

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: VWRow(
                  gap: 20,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          season.posterPath == null ? AppColors.imageFilter : Colors.transparent,
                          BlendMode.color,
                        ),
                        child: Imgy(
                          borderRadius: BorderRadius.circular(5),
                          src: poster,
                          fullSrc: posterFull,
                          width: 100,
                          height: 100 * 1.5,
                          placeholderColor: Colors.black,
                          enableFullScreen: true,
                        ),
                      ),
                    ),
                    Expanded(
                      child: VWColumn(
                        gap: 5,
                        horizontalAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            season.name!,
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.title,
                            ),
                          ),
                          Text(
                            (season.airDate ?? '').formatDateTime(),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "Episodes: ${season.episodes!.length}",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.label,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Divider(
                color: AppColors.line,
                height: 40,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  Episode episode = season.episodes![index];

                  return EpisodeListTile(episode: episode);
                },
                childCount: season.episodes!.length,
              ),
            )
          ],
        );
      },
    ),
  );
}
