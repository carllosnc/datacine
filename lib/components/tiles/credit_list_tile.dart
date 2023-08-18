import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../components.dart';
import '/core/core.dart';
import '/domain/domain.dart';

class CreditListTile extends StatelessWidget {
  final MediaItem item;
  final MediaType mediaType;

  const CreditListTile(
      {super.key, required this.item, required this.mediaType});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(
          '/${mediaType.value}/${item.id.toString()}',
        );
      },
      trailing: const Icon(Icons.chevron_right),
      leading: SizedBox(
        width: 35,
        height: 35 * 1.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: ImageComponent(
            imageSize: ImageSize.posterW154,
            imagePath: item.posterPath,
            imageType: ImageType.poster,
          ),
        ),
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
