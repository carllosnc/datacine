import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/dto/dto.dart';
import '/imports/components.dart';

class TvShowCreators extends StatelessWidget {
  final TvShowDto tvShowDto;

  const TvShowCreators({
    super.key,
    required this.tvShowDto,
  });

  @override
  Widget build(BuildContext context) {
    if (!tvShowDto.hasCreatedBy) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 10,
        children: [
          const SectionTitle(text: "Created by"),
          for (var creator in tvShowDto.createdBy)
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
