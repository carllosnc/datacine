import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class SimpleMediaGrid extends StatelessWidget {
  final List<MediaItem?> list;
  final double maxWidth;
  final String mediaType;

  const SimpleMediaGrid({
    super.key,
    required this.list,
    required this.maxWidth,
    required this.mediaType,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.66666,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          final MediaItem mediaItem = list[index]!;

          return GestureDetector(
            onTap: () {
              context.go('/$mediaType/${mediaItem.id.toString()}');
            },
            child: SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: ImageComponent(
                            imageSize: ImageSize.posterW154,
                            imagePath: mediaItem.posterPath,
                            imageType: ImageType.poster,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
