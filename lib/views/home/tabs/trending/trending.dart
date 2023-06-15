import 'package:flutter/material.dart';
import 'package:giganoid_app/core/core.dart';
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

    return LayoutBuilder(
      builder: (context, constraints) {
        return FutureBuilder(
          future: _trendingService.getTrendings(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            ConnectionState connectionState = snapshot.connectionState;

            if (connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: constraints.maxHeight,
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
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
                  const SizedBox(height: 40),
                  ExtendedMediaCardList(
                    title: "Trending Movies",
                    mediaType: MediaType.movie,
                    list: featuredMovies,
                  ),
                  const SizedBox(height: 20),
                  SimpleMediaGrid(
                    mediaType: MediaType.movie,
                    list: movies,
                    maxWidth: constraints.maxWidth,
                  ),
                  const SizedBox(height: 50),
                  ExtendedMediaCardList(
                    title: "Trending Tv Shows",
                    mediaType: MediaType.tvshow,
                    list: featuredTvShows,
                  ),
                  const SizedBox(height: 20),
                  SimpleMediaGrid(
                    mediaType: MediaType.tvshow,
                    list: tvShows,
                    maxWidth: constraints.maxWidth,
                  ),
                  const SizedBox(height: 50),
                  PeopleList(
                    title: "People Trending",
                    list: people,
                    maxWidth: constraints.maxWidth,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
