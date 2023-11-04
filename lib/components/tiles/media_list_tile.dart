import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

class MediaListTile extends StatelessWidget {
  final MediaItem item;

  const MediaListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    var poster = ImageHelper.getPoster(
      path: item.posterPath,
      size: ImageSize.posterW154,
    );

    return ListTile(
      onTap: () {
        context.push(
          '/${item.mediaType}/${item.id.toString()}',
        );
      },
      trailing: const Icon(Icons.chevron_right),
      leading: ColorFiltered(
        colorFilter: ColorFilter.mode(
          item.backdropPath == null ? ProjectColors(context).imageBackground : Colors.transparent,
          BlendMode.color,
        ),
        child: Imgy(
          borderRadius: BorderRadius.circular(4),
          src: poster,
          fullSrc: poster,
          width: 40,
          height: 60,
          placeholderColor: Colors.black,
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
