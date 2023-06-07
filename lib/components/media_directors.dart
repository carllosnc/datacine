import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import 'package:collection/collection.dart';

class MediaDirectors extends StatelessWidget {
  final Map<String, List<PersonItem>>? credits;

  const MediaDirectors({super.key, required this.credits});

  @override
  Widget build(BuildContext context) {
    List<PersonItem>? crew = credits?["crew"];
    late List<PersonItem>? directors;

    if (crew != null) {
      directors = crew.where((element) => element.job == "Director").toList();
    }

    if (directors != null && directors.isNotEmpty) {
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
                fontColor: const Color.fromARGB(255, 63, 220, 255),
              ),
              //check last
              if (index != directors!.length - 1) const DS1Text('•')
            ],
          );
        }).toList(),
      );
    }

    return const SizedBox.shrink();
  }
}
