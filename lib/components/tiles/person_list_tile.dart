import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/core/core.dart';
import '/imports/components.dart';
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
      onTap: () {
        context.push('/person/${person.id}');
      },
      title: Text(
        person.name!,
        style: TextStyle(
          fontSize: 14,
          color: ProjectColors(context).text,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      leading: SizedBox(
        width: 45,
        height: 45 * 1.5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              person.profilePath == null
                  ? ProjectColors(context).imageFilter
                  : ProjectColors(context).profileFilter,
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
