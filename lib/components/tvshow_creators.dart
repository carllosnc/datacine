import 'package:collection/collection.dart';
import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import 'package:giganoid_app/domain/domain.dart';

class TvShowCreators extends StatelessWidget {
  final List<PersonItem>? creators;

  const TvShowCreators({super.key, required this.creators});

  @override
  Widget build(BuildContext context) {
    if (creators != null && creators!.isNotEmpty) {
      return Wrap(
        spacing: 10,
        runSpacing: 0,
        children: creators!.mapIndexed((num index, PersonItem person) {
          return Wrap(
            spacing: 10,
            children: [
              DS1Text(
                person.name!,
                fontSize: 14,
                fontColor: const Color.fromARGB(255, 63, 220, 255),
              ),
              //check last
              if (index != creators!.length - 1) const DS1Text('•')
            ],
          );
        }).toList(),
      );
    }

    return const SizedBox.shrink();
  }
}
