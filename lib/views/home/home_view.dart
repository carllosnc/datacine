import 'package:flutter/material.dart';
import '/imports/app.dart';
import './tabs/movies/movies.dart';
import './tabs/tv_shows/tv_shows.dart';
import './tabs/trending/trending.dart';
import './tabs/people/people.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool _showMovieFilter = false;
  bool _showTvShowFilter = false;

  bool firstTime = SharedPrefs().prefs.getBool('welcome') ?? true;

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
    if (firstTime) {
      return Welcome(
        onPressed: () {
          setState(() {
            firstTime = false;
          });
        },
      );
    }

    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        floatingActionButton: Wrap(
          children: [
            if (_showMovieFilter)
              FloatingActionButton.extended(
                extendedTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                label: const Text('Discover movies'),
                icon: const Icon(Icons.movie),
                onPressed: () {
                  discoverMediaFilters(
                    context: context,
                    title: "Movie filter",
                    mediaType: MediaType.movie,
                  );
                },
              ),
            if (_showTvShowFilter)
              FloatingActionButton.extended(
                extendedTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                label: const Text('Discover TV Shows'),
                icon: const Icon(Icons.tv),
                onPressed: () {
                  discoverMediaFilters(
                    context: context,
                    title: "TV Show Filter ",
                    mediaType: MediaType.tv,
                  );
                },
              ),
          ],
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            Assets.extendedLogo,
            height: 22,
          ),
          leading: ValueListenableBuilder(
            valueListenable: authNotifier.isSignedIn,
            builder: (context, value, child) {
              return LoginOrProfile(
                isLoggedIn: value,
              );
            },
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
