import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import '/imports.dart';

class ListTileCredit extends StatelessWidget {
  final MediaItem item;
  final MediaType mediaType;

  const ListTileCredit({
    super.key,
    required this.item,
    required this.mediaType,
  });

  @override
  Widget build(BuildContext context) {
    var poster = ImageHelper.getPoster(
      path: item.posterPath,
      size: ImageSize.posterW154,
    );

    final rawDate = mediaType == MediaType.movie
        ? (item.releaseDate?.isNotEmpty == true ? item.releaseDate : item.firstAirDate)
        : (item.firstAirDate?.isNotEmpty == true ? item.firstAirDate : item.releaseDate);
    final dateStr = rawDate?.formatYear();

    final titleText = (item.title?.trim().isNotEmpty == true
            ? item.title
            : (item.name?.trim().isNotEmpty == true ? item.name : '-')) ??
        '-';

    final roleText = (item.character?.trim().isNotEmpty == true
            ? item.character!
            : (item.job?.trim().isNotEmpty == true ? item.job! : ''))
        .trim();

    return ListTile(
      onTap: () {
        context.push(
          '$homePath/${mediaType.value}/${item.id.toString()}',
        );
      },
      trailing: const Icon(Icons.chevron_right),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            item.posterPath == null ? AppColors.imageFilter : Colors.transparent,
            BlendMode.color,
          ),
          child: Imgy(
            src: poster,
            fullSrc: poster,
            width: 40,
            height: 60,
            borderRadius: BorderRadius.circular(4),
            placeholderColor: Colors.black,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dateStr != null && dateStr.isNotEmpty && dateStr != '—' && dateStr != 'Unknown date')
            Text(
              dateStr,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.link,
              ),
            ),
          Text(
            titleText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.title,
            ),
          ),
        ],
      ),
      subtitle: roleText.isNotEmpty
          ? Text(
              roleText,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.label,
              ),
            )
          : null,
    );
  }
}
