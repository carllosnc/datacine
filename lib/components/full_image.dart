import 'dart:ui';

import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '/components/components.dart';

Future<dynamic> openFullPoster(
  BuildContext context,
  ImageItem imageItem,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog.fullscreen(
        insetAnimationCurve: Curves.easeInOut,
        backgroundColor: Colors.black.withOpacity(0.2),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 1.5,
                child: ImageComponent(
                  imagePath: (imageItem.filePath),
                  imageType: ImageType.poster,
                  imageSize: ImageSize.posterOriginal,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
