import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:imgy/imgy.dart';
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

  showModalBottomSheet(
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: ProjectColors(context).modalBackground,
    context: context,
    builder: (context) {
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
              SliverAppBar(
                forceMaterialTransparency: false,
                elevation: 1,
                centerTitle: true,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: Container(
                    color: ProjectColors(context).line,
                    height: 1,
                  ),
                ),
                leading: Container(),
                title: Text(
                  season.name!,
                  style: TextStyle(
                    fontSize: 14,
                    color: ProjectColors(context).title,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            season.posterPath == null ? ProjectColors(context).imageFilterFallback : Colors.transparent,
                            BlendMode.color,
                          ),
                          child: Imgy(
                            borderRadius: BorderRadius.circular(10),
                            src: poster,
                            fullSrc: posterFull,
                            width: 200,
                            height: 200 * 1.5,
                            placeholderColor: Colors.black,
                            enableFullScreen: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            season.name!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
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
                            style: TextStyle(
                              fontSize: 14,
                              color: ProjectColors(context).label,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  color: ProjectColors(context).line,
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
      );
    },
  );
}
