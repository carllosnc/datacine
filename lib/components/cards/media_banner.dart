import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class MediaBanner extends StatelessWidget {
  final MediaItem media;
  final MediaType mediaType;
  final String title;

  const MediaBanner({
    super.key,
    required this.media,
    required this.mediaType,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/${mediaType.value}/${media.id.toString()}',
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 250,
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
                padding: const EdgeInsets.all(20),
                child: Wrap(
                  spacing: 3,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      (media.releaseDate ?? media.firstAirDate ?? '')
                          .formatDateTime(),
                      style: TextStyle(
                        fontSize: 12,
                        color: ProjectColors(context).featured,
                      ),
                    ),
                    Text(
                      (media.title ?? media.name)!,
                      style: TextStyle(
                        fontSize: 15,
                        color: ProjectColors(context).text,
                      ),
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
