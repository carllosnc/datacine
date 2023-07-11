import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/core/core.dart';
import '/components/components.dart';
import '/domain/domain.dart';

class PersonCard extends StatelessWidget {
  final PersonItem personItem;
  const PersonCard({super.key, required this.personItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/person/${personItem.id}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  ProjectColors(context).imageFilter,
                  BlendMode.color,
                ),
                child: ImageComponent(
                  imageSize: ImageSize.profileW185,
                  imagePath: personItem.profilePath,
                  imageType: ImageType.profile,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                personItem.name!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ProjectColors(context).featured,
                  fontSize: 12,
                ),
              ),
              Text(
                personItem.knownForDepartment ?? "―",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
