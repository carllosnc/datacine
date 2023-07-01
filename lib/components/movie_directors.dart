import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';

class MovieDirectors extends StatelessWidget {
  final Map<String, List<PersonItem>>? credits;

  const MovieDirectors({
    super.key,
    required this.credits,
  });

  @override
  Widget build(BuildContext context) {
    if (credits == null) {
      return const SizedBox.shrink();
    }

    List<PersonItem>? crew = credits?["crew"];
    late List<PersonItem>? directors;

    if (crew != null) {
      directors = crew.where((element) => element.job == "Director").toList();
    }

    if (directors == null || directors.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 30,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        itemCount: directors.length,
        itemBuilder: (context, index) {
          PersonItem person = directors![index];

          return LinkButton(
            label: person.name!,
            onPressed: () {},
          );
        },
      ),
    );
  }
}
