import 'package:ds1/ds1.dart';
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
      title: DS1Text(person.name!, fontSize: 15),
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
      subtitle: DS1Text(
        person.character ??
            person.job ??
            person.knownForDepartment ??
            person.department ??
            '-',
        fontSize: 12,
        fontColor: ProjectColors(context).featured,
      ),
    );
  }
}
