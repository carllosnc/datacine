import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/imports/components.dart';
import '/core/core.dart';

class TrendingMediaBanner extends StatelessWidget {
  final MediaItem media;
  final MediaType mediaType;
  final String title;

  const TrendingMediaBanner({
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.1),
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
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      child: Text(
                        media.name ?? media.title!,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
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
