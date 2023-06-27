import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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
      spacing: 5,
      runSpacing: 0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text("😎", style: TextStyle(fontSize: 15)),
        ...creators!.mapIndexed((num index, PersonItem person) {
          return Wrap(
            spacing: 5,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                person.name!,
                style: TextStyle(
                  fontSize: 14,
                  color: ProjectColors(context).link,
                ),
              ),
              //check last
              if (index != creators!.length - 1)
                Text(
                  '•',
                  style: TextStyle(
                    fontSize: 14,
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
