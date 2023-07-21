import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

showMediaCredit(
  BuildContext context,
  List<MediaItem>? list,
  MediaType mediaType,
  String title,
) {
  return showModalBottomSheet(
    isScrollControlled: true,
    useSafeArea: true,
    context: context,
    builder: (context) {
      // if list is null or empty, show empty widget
      if (list == null || list.isEmpty) {
        return Column(
          children: [
            ModalHeader(
              title: title,
            ),
            const Expanded(child: Center(child: Empty())),
          ],
        );
      }

      // sort list by release date
      if (mediaType == MediaType.movie) {
        list.sort(
          (a, b) => b.releaseDate!.compareTo(a.releaseDate!),
        );
      }

      // sort list by first air date
      if (mediaType == MediaType.tv) {
        list.sort(
          (a, b) => b.firstAirDate!.compareTo(a.firstAirDate!),
        );
      }

      return Column(
        children: [
          ModalHeader(
            title: title,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var item = list[index];

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
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors(context).featured,
                        ),
                      ),
                      Text(
                        item.title ?? item.name ?? '-',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ProjectColors(context).text,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    item.character ?? item.job ?? '-',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ProjectColors(context).label,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
    },
  );
}
