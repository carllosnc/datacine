import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/components/components.dart';
import 'package:go_router/go_router.dart';

class TvShowPage extends StatefulWidget {
  final String id;
  const TvShowPage({super.key, required this.id});

  @override
  State<TvShowPage> createState() => _TvShowPageState();
}

class _TvShowPageState extends State<TvShowPage> {
  final TvShowDetailsService _tvShowDetailsService = TvShowDetailsService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _tvShowDetailsService.getTVShow(widget.id),
      builder: (context, AsyncSnapshot<TvShowDetails> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }

        TvShowDetails tvshow = snapshot.data!;
        bool hasKeywords = tvshow.keywords!['results'] != null &&
            tvshow.keywords!['results']!.isNotEmpty;
        bool hasCast = tvshow.credits!['cast'] != null &&
            tvshow.credits!['cast']!.isNotEmpty &&
            tvshow.credits!['cast']!.length > 3;
        bool hasOverview =
            tvshow.overview != null && tvshow.overview!.isNotEmpty;
        bool hasTagline = tvshow.tagline != null && tvshow.tagline!.isNotEmpty;
        bool hasGenres = tvshow.genres != null && tvshow.genres!.isNotEmpty;
        bool hasSeasons = tvshow.seasons != null && tvshow.seasons!.isNotEmpty;

        return Scaffold(
          appBar: AppBar(
            actions: [
              MediaInfo(tvShow: tvshow),
            ],
            title: DS1Text(tvshow.name!, fontSize: 14),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaHeader(tvshow: tvshow),

                //genres
                SectionDivider(condition: hasGenres),
                MediaGenres(tvshow: tvshow),

                //keyword
                SectionDivider(condition: hasKeywords),
                MediaKeywords(tvshow: tvshow),

                //overview
                SectionDivider(condition: hasOverview || hasTagline),
                MediaOverview(tvshow: tvshow),

                //cast
                SectionDivider(condition: hasCast),
                PeopleList(
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

                const SizedBox(height: 30),
              ],
            ),
          ),
          bottomNavigationBar: BottomMenu(
            items: [
              BottomItem(
                label: "Images",
                onTap: () {
                  context.go('/tvshow/${tvshow.id}/images', extra: tvshow);
                },
              ),
              BottomItem(
                label: "Credits",
                onTap: () {
                  context.go('/tvshow/${tvshow.id}/credits', extra: tvshow);
                },
              ),
              const BottomItem(label: "Sugestions"),
              const BottomItem(label: "Similar"),
            ],
          ),
        );
      },
    );
  }
}
