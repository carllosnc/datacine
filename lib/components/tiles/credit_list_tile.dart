import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import '/imports.dart';

class CreditListTile extends StatelessWidget {
  final MediaItem item;
  final MediaType mediaType;

  const CreditListTile({
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

    return ListTile(
      onTap: () {
        context.push(
          '/${mediaType.value}/${item.id.toString()}',
        );
      },
      trailing: const Icon(Icons.chevron_right),
      leading: ColorFiltered(
        colorFilter: ColorFilter.mode(
          item.posterPath == null ? AppColors.imageFilter : Colors.transparent,
          BlendMode.color,
        ),
        child: Imgy(
          src: poster,
          fullSrc: poster,
          width: 40,
          height: 60,
          borderRadius: BorderRadius.circular(5),
          placeholderColor: Colors.black,
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.releaseDate?.formatYear() ?? item.firstAirDate?.formatYear() ?? '-',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.link,
            ),
          ),
          Text(
            item.title ?? item.name ?? '-',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.title,
            ),
          ),
        ],
      ),
      subtitle: Text(
        item.character ?? item.job ?? '-',
        style: TextStyle(
          fontSize: 14,
          color: AppColors.label,
        ),
      ),
    );
  }
}
