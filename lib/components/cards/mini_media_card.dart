import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

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
          '/${mediaType.value}/${mediaItem.id.toString()}',
        );
      },
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  mediaItem.posterPath == null ? ProjectColors(context).imageFilter : Colors.transparent,
                  BlendMode.color,
                ),
                child: Imgy(
                  borderRadius: BorderRadius.circular(5),
                  src: poster,
                  fullSrc: poster,
                  width: double.infinity,
                  height: double.infinity,
                  placeholderColor: ProjectColors(context).imagePlaceholder,
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
                    color: ProjectColors(context).featured,
                  ),
                ),
                Text(
                  (mediaItem.releaseDate ?? mediaItem.firstAirDate ?? "null").formatDateTime(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: ProjectColors(context).label,
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
