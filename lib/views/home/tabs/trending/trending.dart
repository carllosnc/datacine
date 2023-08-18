import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/imports/app.dart';

class TrendingTab extends StatefulWidget {
  const TrendingTab({super.key});

  @override
  State<TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<TrendingTab>
    with AutomaticKeepAliveClientMixin<TrendingTab> {
  final Future getTrendings = TrendingRepository(http.Client()).getTrendings();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return FutureBuilder(
          future: getTrendings,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            ConnectionState connectionState = snapshot.connectionState;

            if (connectionState == ConnectionState.waiting) {
              return const Loading();
            }

            if (snapshot.hasError) {
              return const ErrorBlock();
            }

            MediaItem featuredMovie = snapshot.data['featuredMovie'];
            MediaItem featuredTvShow = snapshot.data['featuredTvshow'];
            List<MediaItem> movies = snapshot.data['movies'];
            List<MediaItem> tvShows = snapshot.data['tvshows'];

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Container(
                    height: 10,
                  ),
                ),
                SliverToBoxAdapter(
                  child: TrendingMediaBanner(
                    title: "Trending Movies",
                    mediaType: MediaType.movie,
                    media: featuredMovie,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 1,
                  ),
                ),
                TrendingMediaGrid(
                  mediaType: MediaType.movie,
                  list: movies,
                  maxWidth: constraints.maxWidth,
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 30,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Icon(
                    Icons.keyboard_double_arrow_down,
                    size: 50,
                    color: ProjectColors(context).featured,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 30,
                  ),
                ),
                SliverToBoxAdapter(
                  child: TrendingMediaBanner(
                    title: "Trending Tv Shows",
                    mediaType: MediaType.tv,
                    media: featuredTvShow,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 1,
                  ),
                ),
                TrendingMediaGrid(
                  mediaType: MediaType.tv,
                  list: tvShows,
                  maxWidth: constraints.maxWidth,
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
