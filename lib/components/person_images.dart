import 'dart:ui';

import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class PersonImages extends StatelessWidget {
  final PersonDetails person;

  const PersonImages({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    List<ImageItem>? images = person.images?['profiles'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Profile images',
            style: TextStyle(
              fontSize: 14,
              color: ProjectColors(context).title,
            ),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: images!.length,
            itemBuilder: (BuildContext context, int index) {
              ImageItem image = images[index];

              return GestureDetector(
                onTap: () {
                  showDialog(
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
                                  imagePath: (image.filePath),
                                  imageType: ImageType.profile,
                                  imageSize: ImageSize.profileOriginal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: SizedBox(
                  width: 130,
                  height: 130 * 1.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ImageComponent(
                      imagePath: (image.filePath),
                      imageType: ImageType.profile,
                      imageSize: ImageSize.profileW185,
                    ),
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
