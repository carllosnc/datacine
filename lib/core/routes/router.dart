import 'package:go_router/go_router.dart';
import '/views/views.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          builder: (context, state) => MoviePage(
            id: state.params['id']!,
          ),
        ),
        GoRoute(
          path: 'tvshow/:id',
          builder: (context, state) => TvShowPage(
            id: state.params['id']!,
          ),
        ),
      ],
    )
  ],
);
