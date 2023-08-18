import 'package:flutter/material.dart';
import 'package:datacine/components/components.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/dto/dto.dart';

class MediaKeywords extends StatelessWidget {
  final MovieDto? movie;
  final TvShowDto? tvshow;

  const MediaKeywords({
    super.key,
    this.movie,
    this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    List<Keyword>? keywords = movie?.keywords ?? tvshow?.keywords;

    return Visibility(
      visible: keywords != null && keywords.isNotEmpty,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            const SectionTitle(text: "Keywords"),
            for (var keyword in keywords!)
              LinkButton(
                label: keyword.name!,
                onPressed: () {
                  if (movie != null) {
                    context.push('/keyword_movies', extra: keyword);
                  }

                  if (tvshow != null) {
                    context.push('/keyword_tvshows', extra: keyword);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
