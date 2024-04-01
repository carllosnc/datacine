import 'package:flutter/material.dart';
import '/imports.dart';

class TrendingTab extends StatefulWidget {
  const TrendingTab({super.key});

  @override
  State<TrendingTab> createState() => _TrendingTabState();
}

class _TrendingTabState extends State<TrendingTab> with AutomaticKeepAliveClientMixin<TrendingTab>, TrendingsService {
  @override
  void initState() {
    super.initState();
    fetchTrendings();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (isLoading) {
          return const Loading();
        }

        if (isError) {
          return const ErrorBlock();
        }

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
                color: AppColors.link,
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
  }

  @override
  bool get wantKeepAlive => true;
}
