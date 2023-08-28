import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

class CreditListTile extends StatelessWidget {
  final MediaItem item;
  final MediaType mediaType;

  const CreditListTile(
      {super.key, required this.item, required this.mediaType});

  @override
  Widget build(BuildContext context) {
    var poster = ImageHelper.getPoster(
      path: item.posterPath,
      size: ImageSize.posterW154,
    );

    return ListTile(
      onTap: () {
        context.push(
          '/${mediaType.value}/${item.id.toString()}',
        );
      },
      trailing: const Icon(Icons.chevron_right),
      leading: Imgy(
        src: poster,
        fullSrc: poster,
        width: 35,
        height: 53,
        placeholderColor: Colors.black,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.releaseDate?.formatYear() ??
                item.firstAirDate?.formatYear() ??
                '-',
            style: TextStyle(
              fontSize: 12,
              color: ProjectColors(context).featured,
            ),
          ),
          Text(
            item.title ?? item.name ?? '-',
            style: TextStyle(
              fontSize: 14,
              color: ProjectColors(context).text,
            ),
          ),
        ],
      ),
      subtitle: Text(
        item.character ?? item.job ?? '-',
        style: TextStyle(
          fontSize: 14,
          color: ProjectColors(context).label,
        ),
      ),
    );
  }
}
