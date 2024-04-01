import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import '/imports.dart';

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
    var poster = ImageHelper.getPoster(
      path: mediaItem.posterPath,
      size: ImageSize.posterW154,
    );

    return GestureDetector(
      onTap: () {
        context.push(
          '$homePath/${mediaType.value}/${mediaItem.id.toString()}',
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    mediaItem.posterPath == null ? AppColors.imageFilter : Colors.transparent,
                    BlendMode.color,
                  ),
                  child: Imgy(
                    borderRadius: BorderRadius.circular(5),
                    src: poster,
                    fullSrc: poster,
                    width: double.infinity,
                    height: double.infinity,
                    placeholderColor: AppColors.imagePlaceholder,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mediaItem.title ?? mediaItem.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.link,
                  ),
                ),
                Text(
                  (mediaItem.releaseDate ?? mediaItem.firstAirDate ?? "null").formatDateTime(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.label,
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
