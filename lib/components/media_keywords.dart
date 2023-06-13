import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
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
        width: double.infinity,
        height: 30,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
          itemCount: keywords!.length,
          itemBuilder: (BuildContext context, int index) {
            return DS1Button(
              size: 'mini',
              label: keywords[index].name!,
              type: DS1ButtonType.outline,
            );
          },
        ),
      ),
    );
  }
}
