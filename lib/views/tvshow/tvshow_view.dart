import 'package:flutter/material.dart';
import 'package:giganoid_app/core/constants/colors.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/components/components.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class TvShowView extends StatefulWidget {
  final String id;
  const TvShowView({super.key, required this.id});

  @override
  State<TvShowView> createState() => _TvShowViewState();
}

class _TvShowViewState extends State<TvShowView> {
  final _mediaDetailsRepository = MediaDetailsRepository(http.Client());

  @override
  Widget build(BuildContext context) {
    final getTvShow = _mediaDetailsRepository.getTvShow(id: widget.id);

    return FutureBuilder(
      future: getTvShow,
      builder: (
        context,
        AsyncSnapshot<(TvShowDetails, http.Response)> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingView();
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }

        TvShowDetails tvshow = snapshot.data!.$1;

        bool hasKeywords = tvshow.keywords!['results'] != null &&
            tvshow.keywords!['results']!.isNotEmpty;
        bool hasCast = tvshow.credits!['cast'] != null &&
            tvshow.credits!['cast']!.isNotEmpty &&
            tvshow.credits!['cast']!.length >= 3;
        bool hasOverview =
            tvshow.overview != null && tvshow.overview!.isNotEmpty;
        bool hasTagline = tvshow.tagline != null && tvshow.tagline!.isNotEmpty;
        bool hasSeasons = tvshow.seasons != null && tvshow.seasons!.isNotEmpty;

        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            actions: [
              MediaInfo(tvShow: tvshow),
            ],
            title: Text(
              "📺   ${tvshow.name!}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: ProjectColors(context).featured,
                textBaseline: TextBaseline.values[1],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaHeader(tvshow: tvshow),

                //keyword
                SectionDivider(condition: hasKeywords),
                MediaKeywords(tvshow: tvshow),

                //overview
                SectionDivider(condition: hasOverview || hasTagline),
                MediaOverview(tvshow: tvshow),

                //cast
                SectionDivider(condition: hasCast),
                PersonHorizontalList(
                  title: 'Cast',
                  list: tvshow.credits!['cast']!,
                  maxWidth: double.infinity,
                ),

                //seasons
                SectionDivider(condition: hasSeasons),
                TvShowSeasons(
                  tvshow: tvshow,
                  maxWidth: MediaQuery.of(context).size.width,
                ),

                const SizedBox(height: 80),
              ],
            ),
          ),
          bottomNavigationBar: BottomMenu(
            items: [
              BottomItem(
                icon: Icons.image_outlined,
                label: "Images",
                onTap: () {
                  context.go(
                    '/tv/${tvshow.id}/images',
                    extra: tvshow,
                  );
                },
              ),
              BottomItem(
                icon: Icons.person_outline,
                label: "Credits",
                onTap: () {
                  context.go(
                    '/tv/${tvshow.id}/credits',
                    extra: tvshow,
                  );
                },
              ),
              BottomItem(
                icon: Icons.thumb_up_outlined,
                label: "Recom.",
                onTap: () {
                  context.go(
                    '/tv/${tvshow.id}/recommendations',
                    extra: tvshow,
                  );
                },
              ),
              BottomItem(
                icon: Icons.tv_outlined,
                label: "Similar",
                onTap: () {
                  context.go(
                    '/tv/${tvshow.id}/similar',
                    extra: tvshow,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
