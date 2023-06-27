import 'package:flutter/material.dart';
import '/core/core.dart';
import '/components/components.dart';
import '/domain/domain.dart';

class PersonListTile extends StatelessWidget {
  final PersonItem person;

  const PersonListTile({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        person.name!,
        style: const TextStyle(fontSize: 15),
      ),
      leading: SizedBox(
        width: 45,
        height: 45 * 1.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              ProjectColors(context).imageFilter,
              BlendMode.color,
            ),
            child: ImageComponent(
              imageSize: ImageSize.profileW185,
              imagePath: person.profilePath,
              imageType: ImageType.profile,
            ),
          ),
        ),
      ),
      subtitle: Text(
        person.character ??
            person.job ??
            person.knownForDepartment ??
            person.department ??
            '-',
        style: TextStyle(
          fontSize: 12,
          color: ProjectColors(context).featured,
        ),
      ),
    );
  }
}
