import 'package:flutter/material.dart';
import 'package:vw/vw.dart';

import '/imports.dart';

showMediaCredit(
  BuildContext context,
  List<MediaItem>? list,
  MediaType mediaType,
  String title,
) {
  if (mediaType == MediaType.movie) {
    list!.sort(
      (a, b) {
        var aDate = a.releaseDate ?? '0';
        var bDate = b.releaseDate ?? '0';

        return bDate.compareTo(aDate);
      },
    );
  }

  if (mediaType == MediaType.tv) {
    list!.sort(
      (a, b) {
        var aDate = a.firstAirDate ?? '0';
        var bDate = b.firstAirDate ?? '0';

        return bDate.compareTo(aDate);
      },
    );
  }

  return VWPage.open(
    borderRadius: 0,
    context: context,
    appBar: AppBar(
      title: FloatPageTitle(
        text: title,
      ),
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
    body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 1,
            color: Colors.transparent,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: list?.length,
            (context, index) {
              MediaItem item = list![index];

              return ListTileCredit(item: item, mediaType: mediaType);
            },
          ),
        ),
      ],
    ),
  );
}
