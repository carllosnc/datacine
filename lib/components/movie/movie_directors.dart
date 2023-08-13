import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/imports/components.dart';

class MovieDirectors extends StatelessWidget {
  final Map<String, List<PersonItem>>? credits;

  const MovieDirectors({
    super.key,
    required this.credits,
  });

  @override
  Widget build(BuildContext context) {
    List<PersonItem>? crew = credits?["crew"];
    late List<PersonItem>? directors;

    if (crew != null) {
      directors = crew.where((element) => element.job == "Director").toList();
    }

    if (directors == null || directors.isEmpty) {
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
          for (var director in directors)
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
