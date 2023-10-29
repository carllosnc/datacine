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
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    useSafeArea: true,
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

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: const Color(0xFF1c2722),
                surfaceTintColor: const Color(0xFF1c2722),
                elevation: 0,
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
                  season.name!.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
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
                      Imgy(
                        borderRadius: BorderRadius.circular(10),
                        src: poster,
                        fullSrc: poster,
                        width: 200,
                        height: 200 * 1.5,
                        placeholderColor: Colors.black,
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
