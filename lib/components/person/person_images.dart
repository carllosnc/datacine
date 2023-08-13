import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/imports/components.dart';
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
            itemCount: images!.length,
            itemBuilder: (BuildContext context, int index) {
              ImageItem image = images[index];

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
