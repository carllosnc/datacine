import 'package:ds1/ds1.dart';
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
        const DS1Text("🎬", fontSize: 15),
        ...directors.mapIndexed((num index, PersonItem person) {
          return Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              DS1Text(
                person.originalName!,
                fontSize: 14,
                fontColor: ProjectColors(context).link,
              ),
              //check last
              if (index != directors!.length - 1)
                DS1Text(
                  '•',
                  fontColor: ProjectColors(context).text.withOpacity(0.2),
                )
            ],
          );
        }).toList(),
      ],
    );
  }
}
