import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/components/components.dart';
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
          return const ErrorView();
        }

        var (TvShowDetails tvshow, _) = snapshot.data!;

        if (tvshow.name == null) {
          return const ErrorView();
        }

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
            title: PageTitle(text: tvshow.name!),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaHeader(tvshow: tvshow),

                const SectionDivider(),

                GridMenu(
                  items: [
                    GridMenuItem(
                      label: 'Posters',
                      icon: Icons.image,
                      onTap: () {
                        context.push(
                          '/tv/$widget.id/images',
                          extra: tvshow,
                        );
                      },
                    ),
                    GridMenuItem(
                      label: 'Credits',
                      icon: Icons.people,
                      onTap: () {
                        context.push(
                          '/tv/$widget.id/credits',
                          extra: tvshow,
                        );
                      },
                    ),
                    GridMenuItem(
                      label: 'Recommendations',
                      icon: Icons.thumb_up,
                      onTap: () {
                        context.push(
                          '/tv/$widget.id/recommendations',
                          extra: tvshow,
                        );
                      },
                    ),
                    GridMenuItem(
                      label: 'Similar',
                      icon: Icons.movie,
                      onTap: () {
                        context.push(
                          '/tv/$widget.id/similar',
                          extra: tvshow,
                        );
                      },
                    ),
                  ],
                ),

                //keyword
                SectionDivider(condition: hasKeywords),
                MediaKeywords(tvshow: tvshow),

                //overview
                SectionDivider(condition: hasOverview || hasTagline),
                MediaOverview(tvshow: tvshow),

                //cast
                SectionDivider(condition: hasCast),
                PersonHorizontalList(
                  title: '· Cast',
                  list: tvshow.credits!['cast']!,
                  maxWidth: double.infinity,
                ),

                //seasons
                SectionDivider(condition: hasSeasons),
                TvShowSeasons(
                  tvshow: tvshow,
                  maxWidth: MediaQuery.of(context).size.width,
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }
}
