import 'package:flutter/material.dart';
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

              return GestureDetector(
                onTap: () {
                  openFullImage(
                    context: context,
                    image: image,
                    imageType: ImageType.profile,
                    imageSize: ImageSize.profileOriginal,
                  );
                },
                child: SizedBox(
                  width: 130,
                  height: 130 * 1.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
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
