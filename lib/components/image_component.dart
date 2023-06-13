import 'package:flutter/material.dart';
import '/core/core.dart';

enum ImageType { poster, backdrop, profile }

class ImageComponent extends StatelessWidget {
  final String? imagePath;
  final ImageType imageType;
  final ImageSize imageSize;

  const ImageComponent({
    super.key,
    required this.imagePath,
    required this.imageType,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    String fallBackImage = Assets.noPoster;

    switch (imageType) {
      case ImageType.poster:
        fallBackImage = Assets.noPoster;
        break;
      case ImageType.backdrop:
        fallBackImage = Assets.noBackdrop;
        break;
      case ImageType.profile:
        fallBackImage = Assets.noProfile;
        break;
    }

    if (imagePath == null) {
      return Image.asset(
        fallBackImage,
        filterQuality: FilterQuality.high,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      );
    }

    return Container(
      color: ProjectColors.imageBackground,
      child: Image.network(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topCenter,
        ImageHelper.getBackdrop(
          path: imagePath!,
          size: imageSize,
        ),
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
      ),
    );
  }
}
