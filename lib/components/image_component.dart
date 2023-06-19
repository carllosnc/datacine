import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
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
      color: ProjectColors(context).imageBackground,
      child: FadeInImage.memoryNetwork(
        fadeInDuration: const Duration(milliseconds: 300),
        placeholder: kTransparentImage,
        image: ImageHelper.getBackdrop(
          path: imagePath!,
          size: imageSize,
        ),
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.topCenter,
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
      ),
    );
  }
}
