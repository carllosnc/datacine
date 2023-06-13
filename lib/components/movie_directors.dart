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
      spacing: 10,
      runSpacing: 0,
      children: directors.mapIndexed((num index, PersonItem person) {
        return Wrap(
          spacing: 10,
          children: [
            DS1Text(
              person.originalName!,
              fontSize: 14,
              fontColor: ProjectColors.link,
            ),
            //check last
            if (index != directors!.length - 1)
              DS1Text('•', fontColor: Colors.white.withOpacity(0.4))
          ],
        );
      }).toList(),
    );
  }
}
