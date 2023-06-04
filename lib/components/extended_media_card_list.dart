import 'package:flutter/material.dart';
import '/domain/domain.dart';
import 'components.dart';
import 'package:ds1/ds1.dart';
import '/core/core.dart';
import 'package:go_router/go_router.dart';

class _Card extends StatelessWidget {
  final MediaItem media;

  const _Card({
    required this.media,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/movie/${media.id.toString()}');
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: 290,
        height: 200,
        child: Stack(
          children: [
            ImageComponent(
              imagePath: media.backdropPath,
              imageType: ImageType.backdrop,
              imageSize: ImageSize.backdropW300,
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                width: 75,
                height: 100,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white38,
                    width: 1,
                  ),
                ),
                child: ImageComponent(
                  imageSize: ImageSize.posterW185,
                  imagePath: media.posterPath,
                  imageType: ImageType.poster,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  spacing: 3,
                  direction: Axis.vertical,
                  children: [
                    DS1Text(
                      DateHelper.format(
                          media.releaseDate ?? media.firstAirDate),
                      fontSize: 12,
                      truncate: 33,
                      fontColor: Colors.yellow,
                    ),
                    DS1Text(
                      (media.title ?? media.name)!,
                      fontSize: 15,
                      truncate: 33,
                      fontColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExtendedMediaCardList extends StatelessWidget {
  final List<MediaItem> list;

  const ExtendedMediaCardList({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 15);
        },
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(15),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          MediaItem item = list[index];

          return _Card(media: item);
        },
      ),
    );
  }
}
