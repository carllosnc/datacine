import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/views/views.dart';
import '/domain/domain.dart';
import '/core/core.dart';

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
    final movie = state.extra as MovieDetails;

    return MovieImagesView(movie: movie);
  },
);

final movieCredits = GoRoute(
  path: 'credits',
  builder: (context, state) {
    final movie = state.extra as MovieDetails;

    return MovieCreditsView(movie: movie);
  },
);

final movieRecommendations = GoRoute(
  path: 'recommendations',
  builder: (context, state) {
    final movie = state.extra as MovieDetails;

    return MovieRecommendationView(movie: movie);
  },
);

final movieSimilar = GoRoute(
  path: 'similar',
  builder: (context, state) {
    final movie = state.extra as MovieDetails;

    return MovieSimilarView(movie: movie);
  },
);

// tvshow

final tvshowImages = GoRoute(
  path: 'images',
  builder: (context, state) {
    final tvshow = state.extra as TvShowDetails;

    return TvShowImagesView(tvshow: tvshow);
  },
);

final tvshowCredits = GoRoute(
  path: 'credits',
  builder: (context, state) {
    final tvshow = state.extra as TvShowDetails;

    return TvShowCreditsView(tvshow: tvshow);
  },
);

final tvshowRecommendations = GoRoute(
  path: 'recommendations',
  builder: (context, state) {
    final tvshow = state.extra as TvShowDetails;

    return TvShowRecommendationView(tvshow: tvshow);
  },
);

final tvshowSimilar = GoRoute(
  path: 'similar',
  builder: (context, state) {
    final tvshow = state.extra as TvShowDetails;

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
      ],
    )
  ],
);
