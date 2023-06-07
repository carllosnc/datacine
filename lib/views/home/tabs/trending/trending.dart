import 'package:flutter/material.dart';
import '/data/data.dart';
import '/domain/domain.dart';
import '/components/components.dart';

class TrendingTab extends StatefulWidget {
  const TrendingTab({super.key});

  @override
  State<TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<TrendingTab>
    with AutomaticKeepAliveClientMixin<TrendingTab> {
  final _trendingService = TrendingService();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder(
        future: _trendingService.getTrendings(),
        builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
        ) {
          ConnectionState connectionState = snapshot.connectionState;

          if (connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: constraints.maxHeight,
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 50,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10),
                  Text('Something went wrong!'),
                ],
              ),
            );
          }

          List<MediaItem> movies = snapshot.data['movies'];
          List<MediaItem> tvShows = snapshot.data['tvshows'];
          List<MediaItem> featuredMovies = snapshot.data['featuredMovies'];
          List<MediaItem> featuredTvShows = snapshot.data['featuredTvshows'];
          List<PersonItem> people = snapshot.data['people'];

          return SingleChildScrollView(
            child: Column(
              children: [
                const SectionDivider(
                  title: "Trending Movies",
                  icon: Icons.movie,
                ),
                ExtendedMediaCardList(
                  mediaType: 'movie',
                  list: featuredMovies,
                ),
                SimpleMediaGrid(
                  mediaType: "movie",
                  list: movies,
                  maxWidth: constraints.maxWidth,
                ),
                const SizedBox(height: 20),
                const SectionDivider(
                  title: "Trending TV Shows",
                  icon: Icons.tv,
                ),
                ExtendedMediaCardList(
                  mediaType: 'tvshow',
                  list: featuredTvShows,
                ),
                SimpleMediaGrid(
                  mediaType: "tvshow",
                  list: tvShows,
                  maxWidth: constraints.maxWidth,
                ),
                const SizedBox(height: 20),
                const SectionDivider(
                  title: "Tending People",
                  icon: Icons.person,
                ),
                const SizedBox(height: 10),
                PeopleGrid(
                  list: people,
                  maxWidth: constraints.maxWidth,
                ),
              ],
            ),
          );
        },
      );
    });
  }

  @override
  bool get wantKeepAlive => true;
}
