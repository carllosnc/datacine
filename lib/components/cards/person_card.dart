import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

class PersonCard extends StatelessWidget {
  final PersonItem personItem;
  const PersonCard({super.key, required this.personItem});

  @override
  Widget build(BuildContext context) {
    var poster = ImageHelper.getProfile(
      path: personItem.profilePath,
      size: ImageSize.profileW185,
    );

    return GestureDetector(
      onTap: () {
        context.push('/person/${personItem.id}');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                ProjectColors(context).imageFilter,
                BlendMode.color,
              ),
              child: Imgy(
                src: poster,
                fullSrc: poster,
                rounded: 7,
                width: double.infinity,
                placeholderColor: Colors.black,
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
                  fontSize: 14,
                ),
              ),
              Text(
                personItem.character ?? personItem.knownForDepartment ?? "―",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ProjectColors(context).label,
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
