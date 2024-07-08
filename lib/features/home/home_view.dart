import 'package:flutter/material.dart';
import '/imports.dart';
import 'components/tabs/movies.dart';
import 'components/tabs/tv_shows.dart';
import 'components/tabs/trending.dart';
import 'components/tabs/people.dart';
import 'components/movie_filters/movie_filters.dart';
import 'components/tvshow_filters/tvshow_filters.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool _showMovieFilter = false;
  bool _showTvShowFilter = false;

  @override
  initState() {
    super.initState();

    _tabController = TabController(vsync: this, length: 4);
    _tabController.addListener(addFilter);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  addFilter() {
    var index = _tabController.index;

    setState(() {
      if (index == 1) {
        _showMovieFilter = true;
        _showTvShowFilter = false;
      } else if (index == 2) {
        _showTvShowFilter = true;
        _showMovieFilter = false;
      } else {
        _showMovieFilter = false;
        _showTvShowFilter = false;
      }
    });
  }

  Widget getFilter() {
    if (_showMovieFilter) {
      return const MovieFilters();
    }

    if (_showTvShowFilter) {
      return const TvShowFilters();
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            Assets.extendedLogo,
            height: 22,
          ),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Trending'),
              Tab(text: 'Movies'),
              Tab(text: 'TV'),
              Tab(text: 'People'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            TrendingTab(),
            MoviesTab(),
            TVShowsTab(),
            PeopleTab(),
          ],
        ),
        bottomNavigationBar: getFilter(),
      ),
    );
  }
}
