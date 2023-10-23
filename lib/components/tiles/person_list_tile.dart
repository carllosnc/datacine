import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

class PersonListTile extends StatelessWidget {
  final PersonItem person;

  const PersonListTile({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    var image = ImageHelper.getProfile(
      path: person.profilePath,
      size: ImageSize.profileW185,
    );

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
      leading: ColorFiltered(
        colorFilter: ColorFilter.mode(
          person.profilePath == null
              ? ProjectColors(context).imageFilter
              : ProjectColors(context).profileFilter,
          BlendMode.color,
        ),
        child: Imgy(
          borderRadius: BorderRadius.circular(4),
          src: image,
          fullSrc: image,
          width: 40,
          height: 55,
          placeholderColor: Colors.black,
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
