import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ds1/ds1.dart';
import '/domain/domain.dart';
import '/core/core.dart';

class TvShowCreators extends StatelessWidget {
  final List<PersonItem>? creators;

  const TvShowCreators({
    super.key,
    required this.creators,
  });

  @override
  Widget build(BuildContext context) {
    if (creators == null || creators!.isEmpty) return const SizedBox.shrink();

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
              fontColor: ProjectColors.link,
            ),
            //check last
            if (index != creators!.length - 1)
              DS1Text('•', fontColor: Colors.white.withOpacity(0.2))
          ],
        );
      }).toList(),
    );
  }
}
