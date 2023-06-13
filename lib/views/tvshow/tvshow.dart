import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/components/components.dart';

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

        TvShowDetails tvShow = snapshot.data!;
        bool hasKeywords = tvShow.keywords!['results'] != null &&
            tvShow.keywords!['results']!.isNotEmpty;
        bool hasCast = tvShow.credits!['cast'] != null &&
            tvShow.credits!['cast']!.isNotEmpty;
        bool hasOverview =
            tvShow.overview != null && tvShow.overview!.isNotEmpty;
        bool hasTagline = tvShow.tagline != null && tvShow.tagline!.isNotEmpty;
        bool hasGenres = tvShow.genres != null && tvShow.genres!.isNotEmpty;
        bool hasSeasons = tvShow.seasons != null && tvShow.seasons!.isNotEmpty;

        return Scaffold(
          appBar: AppBar(
            actions: [
              MediaInfo(tvShow: tvShow),
            ],
            title: DS1Text(tvShow.name!, fontSize: 14),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediaHeader(tvshow: tvShow),

                //genres
                SectionDivider(condition: hasGenres),
                MediaGenres(tvshow: tvShow),

                //keyword
                SectionDivider(condition: hasKeywords),
                MediaKeywords(tvshow: tvShow),

                //overview
                SectionDivider(condition: hasOverview || hasTagline),
                MediaOverview(tvshow: tvShow),

                //cast
                SectionDivider(condition: hasCast),
                PeopleList(
                  title: 'Cast',
                  list: tvShow.credits!['cast']!,
                  maxWidth: double.infinity,
                ),

                //seasons
                SectionDivider(condition: hasSeasons),
                TvShowSeasons(
                  tvshow: tvShow,
                  maxWidth: MediaQuery.of(context).size.width,
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
          bottomNavigationBar: const BottomMenu(
            items: [
              BottomItem(label: "Images"),
              BottomItem(label: "Credits"),
              BottomItem(label: "Sugestions"),
              BottomItem(label: "Similar"),
            ],
          ),
        );
      },
    );
  }
}
