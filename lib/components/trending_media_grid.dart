import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

class TrendingMediaGrid extends StatelessWidget {
  final List<MediaItem?> list;
  final double maxWidth;
  final MediaType mediaType;

  const TrendingMediaGrid({
    super.key,
    required this.list,
    required this.maxWidth,
    required this.mediaType,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.66666,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final MediaItem mediaItem = list[index]!;

        var poster = ImageHelper.getPoster(
          path: mediaItem.posterPath,
          size: ImageSize.posterW154,
        );

        return GestureDetector(
          onTap: () {
            context.push('/${mediaType.value}/${mediaItem.id.toString()}');
          },
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Imgy(
                    src: poster,
                    fullSrc: poster,
                    width: double.infinity,
                    placeholderColor: ProjectColors(context).imagePlaceholder,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
