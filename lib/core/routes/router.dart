import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/views/views.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '/dto/dto.dart';

//keyword

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

// company

final companyDetails = GoRoute(
  path: 'company',
  builder: (BuildContext content, state) {
    final company = state.extra as Company;

    return CompanyView(company: company);
  },
);

// person

final personDetails = GoRoute(
  path: 'person/:id',
  builder: (BuildContext content, state) {
    return PersonView(id: state.params['id']!);
  },
);

// movie

final movieImages = GoRoute(
  path: 'images',
  builder: (context, state) {
    final movie = state.extra as MovieDto;

    return MovieImagesView(movie: movie);
  },
);

final movieCredits = GoRoute(
  path: 'credits',
  builder: (context, state) {
    final movie = state.extra as MovieDto;

    return MovieCreditsView(movie: movie);
  },
);

final movieRecommendations = GoRoute(
  path: 'recommendations',
  builder: (context, state) {
    final movie = state.extra as MovieDto;

    return MovieRecommendationView(movie: movie);
  },
);

final movieSimilar = GoRoute(
  path: 'similar',
  builder: (context, state) {
    final movie = state.extra as MovieDto;

    return MovieSimilarView(movie: movie);
  },
);

// tvshow

final tvshowImages = GoRoute(
  path: 'images',
  builder: (context, state) {
    final tvshow = state.extra as TvShowDto;

    return TvShowImagesView(tvshow: tvshow);
  },
);

final tvshowCredits = GoRoute(
  path: 'credits',
  builder: (context, state) {
    final tvshow = state.extra as TvShowDto;

    return TvShowCreditsView(tvshow: tvshow);
  },
);

final tvshowRecommendations = GoRoute(
  path: 'recommendations',
  builder: (context, state) {
    final tvshow = state.extra as TvShowDto;

    return TvShowRecommendationView(tvshow: tvshow);
  },
);

final tvshowSimilar = GoRoute(
  path: 'similar',
  builder: (context, state) {
    final tvshow = state.extra as TvShowDto;

    return TvShowSimilarView(tvshow: tvshow);
  },
);

final movieDetails = GoRoute(
  path: '${MediaType.movie.value}/:id',
  builder: (context, state) => MovieView(id: state.params['id']!),
  routes: [
    movieImages,
    movieCredits,
    movieRecommendations,
    movieSimilar,
  ],
);

final tvshowDetails = GoRoute(
  path: '${MediaType.tv.value}/:id',
  builder: (context, state) => TvShowView(id: state.params['id']!),
  routes: [
    tvshowImages,
    tvshowCredits,
    tvshowRecommendations,
    tvshowSimilar,
  ],
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
