import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ds1/ds1.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class ExtendedMediaCardList extends StatelessWidget {
  final List<MediaItem> list;
  final MediaType mediaType;
  final String title;

  const ExtendedMediaCardList({
    super.key,
    required this.list,
    required this.mediaType,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DS1Text(
            title,
            fontSize: 16,
            fontColor: ProjectColors(context).title,
          ),
        ),
        const SizedBox(height: 13),
        SizedBox(
          width: double.infinity,
          height: 180,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 10);
            },
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              MediaItem media = list[index];

              return GestureDetector(
                onTap: () {
                  context.go(
                    '/${mediaType.value}/${media.id.toString()}',
                  );
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
                        imageSize: ImageSize.backdropW780,
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
                        bottom: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Wrap(
                            spacing: 3,
                            direction: Axis.vertical,
                            children: [
                              DS1Text(
                                (media.releaseDate ?? media.firstAirDate ?? '')
                                    .formatDateTime(),
                                fontSize: 12,
                                truncate: 33,
                                fontColor: ProjectColors(context).featured,
                              ),
                              DS1Text(
                                (media.title ?? media.name)!,
                                fontSize: 15,
                                truncate: 33,
                                fontColor: ProjectColors(context).text,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
