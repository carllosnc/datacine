import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/imports/components.dart';
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
          (a, b) {
            var aDate = a.releaseDate ?? '0';
            var bDate = b.releaseDate ?? '0';

            return bDate.compareTo(aDate);
          },
        );
      }

      // sort list by first air date
      if (mediaType == MediaType.tv) {
        list.sort(
          (a, b) {
            var aDate = a.firstAirDate ?? '0';
            var bDate = b.firstAirDate ?? '0';

            return bDate.compareTo(aDate);
          },
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
                MediaItem item = list[index];

                return CreditListTile(item: item, mediaType: mediaType);
              },
            ),
          )
        ],
      );
    },
  );
}
