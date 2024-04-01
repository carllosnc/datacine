import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/imports.dart';

final keywordMovies = GoRoute(
  path: 'keyword_movies',
  builder: (context, state) {
    final keyword = state.extra as Keyword;

    return KeywordView(
      keyword: keyword,
      mediaType: MediaType.movie,
    );
  },
);

final keywordTvShows = GoRoute(
  path: 'keyword_tvshows',
  builder: (context, state) {
    final keyword = state.extra as Keyword;

    return KeywordView(
      keyword: keyword,
      mediaType: MediaType.tv,
    );
  },
);

final companyDetails = GoRoute(
  path: 'company',
  builder: (BuildContext content, state) {
    final company = state.extra as Company;

    return CompanyView(company: company);
  },
);

final personDetails = GoRoute(
  path: 'person/:id',
  builder: (BuildContext content, state) {
    return PersonView(id: state.params['id']!);
  },
);

final movieDetails = GoRoute(
  path: '${MediaType.movie.value}/:id',
  builder: (context, state) => MovieView(id: state.params['id']!),
);

final tvshowDetails = GoRoute(
  path: '${MediaType.tv.value}/:id',
  builder: (context, state) => TvShowView(id: state.params['id']!),
);

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeView(),
      routes: [
        movieDetails,
        tvshowDetails,
        personDetails,
        companyDetails,
        keywordMovies,
        keywordTvShows,
      ],
    )
  ],
);
