import 'package:flutter/material.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

class PersonImages extends StatelessWidget {
  final PersonDto person;

  const PersonImages({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(text: "Profile Images"),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 15);
            },
            itemCount: person.profileImages!.length,
            itemBuilder: (BuildContext context, int index) {
              ImageItem image = person.profileImages![index];

              var previewImage = ImageHelper.getPoster(
                path: image.filePath,
                size: ImageSize.profileW185,
              );

              var fullScreenImage = ImageHelper.getPoster(
                path: image.filePath,
                size: ImageSize.profileOriginal,
              );

              return Imgy(
                rounded: 5,
                width: 120,
                src: previewImage,
                fullSrc: fullScreenImage,
                enableFullScreen: true,
                placeholderColor: Colors.black,
              );
            },
          ),
        ),
      ],
    );
  }
}
