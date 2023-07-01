import 'package:flutter/material.dart';
import 'package:giganoid_app/components/components.dart';
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
            return LinkButton(
              label: keywords[index].name!,
              onPressed: () {},
            );
          },
        ),
      ),
    );
  }
}
