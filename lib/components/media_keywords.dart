import 'package:flutter/material.dart';
import 'package:giganoid_app/components/components.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';

class MediaKeywords extends StatelessWidget {
  final MovieDetails? movie;
  final TvShowDetails? tvshow;

  const MediaKeywords({
    super.key,
    this.movie,
    this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    List<Keyword>? keywords =
        movie?.keywords?['keywords'] ?? tvshow?.keywords?['results'];

    return Visibility(
      visible: keywords != null && keywords.isNotEmpty,
      child: SizedBox(
        height: 30,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
          itemCount: keywords!.length,
          itemBuilder: (BuildContext context, int index) {
            Keyword keyword = keywords[index];

            return LinkButton(
              label: keyword.name!,
              onPressed: () {
                if (movie != null) {
                  context.push('/keyword_movies', extra: keyword);
                }

                if (tvshow != null) {
                  context.push('/keyword_tvshows', extra: keyword);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
