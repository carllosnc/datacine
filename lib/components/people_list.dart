import 'package:flutter/material.dart';
import 'package:ds1/ds1.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class _Card extends StatelessWidget {
  final PeopleItem peopleItem;

  const _Card({
    required this.peopleItem,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
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
          const SizedBox(height: 5),
          DS1Text(
            peopleItem.originalName!,
            truncate: 14,
            fontSize: 13,
          ),
          DS1Text(
            peopleItem.knownForDepartment!,
            truncate: 10,
            fontSize: 12,
            fontColor: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

class PeopleGrid extends StatelessWidget {
  final List<PeopleItem?> list;
  final double maxWidth;

  const PeopleGrid({
    super.key,
    required this.list,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: maxWidth,
      height: 230,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          final PeopleItem peopleItem = list[index]!;

          return _Card(peopleItem: peopleItem);
        },
      ),
    );
  }
}
