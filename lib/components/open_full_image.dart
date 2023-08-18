import 'package:flutter/material.dart';
import '/imports/app.dart';

Future<dynamic> openFullImage({
  required BuildContext context,
  required ImageItem image,
  required ImageType imageType,
  required ImageSize imageSize,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog.fullscreen(
        insetAnimationCurve: Curves.easeInOut,
        backgroundColor: Colors.black.withOpacity(0.6),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 1.5,
              child: ImageComponent(
                imagePath: (image.filePath),
                imageType: imageType,
                imageSize: imageSize,
              ),
            ),
          ),
        ),
      );
    },
  );
}
