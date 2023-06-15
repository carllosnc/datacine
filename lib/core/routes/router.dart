import 'package:go_router/go_router.dart';
import '/views/views.dart';
import '/domain/domain.dart';

final movieRoute = GoRoute(
  path: 'movie/:id',
  builder: (context, state) => MoviePage(id: state.params['id']!),
  routes: [
    GoRoute(
      path: 'images',
      builder: (context, state) {
        final movie = state.extra as MovieDetails;

        return MovieImagesView(movie: movie);
      },
    ),
    GoRoute(
      path: 'credits',
      builder: (context, state) {
        final movie = state.extra as MovieDetails;

        return MovieCreditsView(movie: movie);
      },
    ),
  ],
);

final tvshowRoute = GoRoute(
  path: 'tvshow/:id',
  builder: (context, state) => TvShowPage(id: state.params['id']!),
  routes: [
    GoRoute(
      path: 'images',
      builder: (context, state) {
        final tvshow = state.extra as TvShowDetails;

        return TvShowImagesView(tvshow: tvshow);
      },
    ),
    GoRoute(
      path: 'credits',
      builder: (context, state) {
        final tvshow = state.extra as TvShowDetails;

        return TvShowCreditsView(tvshow: tvshow);
      },
    ),
  ],
);

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        movieRoute,
        tvshowRoute,
      ],
    )
  ],
);
