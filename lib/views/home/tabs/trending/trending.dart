import 'package:flutter/material.dart';
import 'package:giganoid_app/core/core.dart';
import '/data/data.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import 'package:http/http.dart' as http;

class TrendingTab extends StatefulWidget {
  const TrendingTab({super.key});

  @override
  State<TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<TrendingTab>
    with AutomaticKeepAliveClientMixin<TrendingTab> {
  // get trending movies, tv shows and people
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

            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  MediaBanner(
                    title: "Trending Movies",
                    mediaType: MediaType.movie,
                    media: featuredMovie,
                  ),
                  const SizedBox(height: 1),
                  SimpleMediaGrid(
                    mediaType: MediaType.movie,
                    list: movies,
                    maxWidth: constraints.maxWidth,
                  ),
                  const SizedBox(height: 30),
                  Icon(
                    Icons.keyboard_double_arrow_down,
                    size: 50,
                    color: ProjectColors(context).featured,
                  ),
                  const SizedBox(height: 30),
                  MediaBanner(
                    title: "Trending Tv Shows",
                    mediaType: MediaType.tv,
                    media: featuredTvShow,
                  ),
                  SimpleMediaGrid(
                    mediaType: MediaType.tv,
                    list: tvShows,
                    maxWidth: constraints.maxWidth,
                  ),
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
