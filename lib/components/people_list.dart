import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class PeopleList extends StatelessWidget {
  final List<PersonItem>? list;
  final double maxWidth;
  final String title;

  const PeopleList({
    super.key,
    required this.list,
    required this.maxWidth,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (list!.isEmpty || list == null) {
      return const SizedBox.shrink();
    }

    List<PersonItem>? cutList = list;

    if (list!.length > 20) {
      cutList = list!.sublist(0, 20);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: DS1Text(title, fontSize: 16, fontColor: Colors.white),
        ),
        const SizedBox(height: 10),
        Container(
          width: maxWidth,
          height: 205,
          color: Colors.transparent,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemCount: cutList!.length,
            itemBuilder: (BuildContext context, int index) {
              final PersonItem peopleItem = cutList![index];

              return Container(
                color: Colors.transparent,
                width: 110,
                child: Wrap(
                  runSpacing: 5,
                  children: [
                    SizedBox(
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            ProjectColors.imageFilter,
                            BlendMode.color,
                          ),
                          child: ImageComponent(
                            imageSize: ImageSize.profileW185,
                            imagePath: peopleItem.profilePath,
                            imageType: ImageType.profile,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          peopleItem.name!,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          peopleItem.character ??
                              peopleItem.knownForDepartment!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
