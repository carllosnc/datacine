import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';

class TvShowCreators extends StatelessWidget {
  final List<PersonItem>? creators;

  const TvShowCreators({
    super.key,
    required this.creators,
  });

  @override
  Widget build(BuildContext context) {
    if (creators == null || creators!.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 30,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
        itemCount: creators!.length,
        itemBuilder: (context, index) {
          PersonItem person = creators![index];

          return LinkButton(
            label: person.name!,
            onPressed: () {},
          );
        },
      ),
    );
  }
}
