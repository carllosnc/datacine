import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/imports/components.dart';
import '/dto/dto.dart';

class MovieDirectors extends StatelessWidget {
  final MovieDto movie;

  const MovieDirectors({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    if (movie.hasDirectors == false) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 10,
        children: [
          const SectionTitle(text: "Directed by"),
          for (var director in movie.directors)
            LinkButton(
              label: director.name!,
              onPressed: () {
                context.push('/person/${director.id}');
              },
            ),
        ],
      ),
    );
  }
}
