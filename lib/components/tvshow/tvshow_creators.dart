import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/imports/components.dart';

class TvShowCreators extends StatelessWidget {
  final List<PersonItem>? creators;

  const TvShowCreators({
    super.key,
    required this.creators,
  });

  @override
  Widget build(BuildContext context) {
    if (creators == null || creators!.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 10,
        children: [
          const SectionTitle(text: "Created by"),
          for (var creator in creators!)
            LinkButton(
              label: creator.name!,
              onPressed: () {
                context.push('/person/${creator.id}');
              },
            ),
        ],
      ),
    );
  }
}
