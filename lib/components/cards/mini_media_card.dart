import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class MiniMediaCard extends StatelessWidget {
  final MediaItem mediaItem;
  final MediaType mediaType;

  const MiniMediaCard({
    super.key,
    required this.mediaItem,
    required this.mediaType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/${mediaType.value}/${mediaItem.id.toString()}',
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageComponent(
                  imageSize: ImageSize.posterW154,
                  imagePath: mediaItem.posterPath,
                  imageType: ImageType.poster,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (mediaItem.releaseDate ?? mediaItem.firstAirDate ?? "null")
                      .formatDateTime(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ProjectColors(context).featured,
                    fontSize: 10,
                  ),
                ),
                Text(
                  mediaItem.title ?? mediaItem.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
