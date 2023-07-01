import 'package:flutter/material.dart';
import '/core/core.dart';
import '/components/components.dart';
import './tabs/movies/movies.dart';
import './tabs/tv_shows/tv_shows.dart';
import './tabs/trending/trending.dart';
import './tabs/people/people.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        floatingActionButton: Wrap(
          children: [
            if (_showMovieFilter)
              FloatingActionButton(
                onPressed: () {
                  discoverMediaFilters(
                    context: context,
                    title: "Filter Movies",
                    mediaType: MediaType.movie,
                  );
                },
                child: const Icon(Icons.movie_filter),
              ),
            if (_showTvShowFilter)
              FloatingActionButton(
                onPressed: () {
                  discoverMediaFilters(
                    context: context,
                    title: "Filter TV Shows",
                    mediaType: MediaType.tv,
                  );
                },
                child: const Icon(Icons.tv),
              ),
          ],
        ),
        appBar: AppBar(
          title: Image.asset(
            Assets.extendedLogo,
            height: 20,
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
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Trendings'),
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
      ),
    );
  }
}
