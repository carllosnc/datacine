import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/imports/app.dart';

class MediaListTile extends StatelessWidget {
  final MediaItem item;

  const MediaListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(
          '/${item.mediaType}/${item.id.toString()}',
        );
      },
      trailing: const Icon(Icons.chevron_right),
      leading: SizedBox(
        width: 45,
        height: 45 * 1.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: ImageComponent(
            imageSize: ImageSize.posterW154,
            imagePath: item.posterPath,
            imageType: ImageType.poster,
          ),
        ),
      ),
      title: Text(
        item.title ?? item.name ?? '-',
        style: TextStyle(
          fontSize: 14,
          color: ProjectColors(context).text,
        ),
      ),
      subtitle: Text(
        "${(item.releaseDate ?? item.firstAirDate!).formatYear()} — ${item.mediaType!.capitalize()}",
        style: TextStyle(
          fontSize: 12,
          color: ProjectColors(context).featured,
        ),
      ),
    );
  }
}
