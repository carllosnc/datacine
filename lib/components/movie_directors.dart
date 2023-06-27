import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '/domain/domain.dart';
import '/core/core.dart';

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

    return Wrap(
      spacing: 5,
      runSpacing: 0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text(
          "🎬",
          style: TextStyle(fontSize: 15),
        ),
        ...directors.mapIndexed((num index, PersonItem person) {
          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              Text(
                person.originalName!,
                style: TextStyle(
                  fontSize: 14,
                  color: ProjectColors(context).link,
                ),
              ),
              //check last
              if (index != directors!.length - 1)
                Text(
                  '•',
                  style: TextStyle(
                    color: ProjectColors(context).text.withOpacity(0.2),
                  ),
                )
            ],
          );
        }).toList(),
      ],
    );
  }
}
