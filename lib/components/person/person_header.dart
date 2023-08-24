import 'package:flutter/material.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

class PersonHeader extends StatelessWidget {
  final PersonDto person;

  const PersonHeader({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    var profileImage = ImageHelper.getProfile(
      path: person.profilePath,
      size: ImageSize.profileOriginal,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            ProjectColors(context).profileFilter,
            BlendMode.color,
          ),
          child: Imgy(
            width: 200,
            height: 200 * 1.5,
            src: profileImage,
            fullSrc: profileImage,
            rounded: 10,
            padding: 5,
            borderColor: Colors.white.withOpacity(0.2),
            borderWidth: 2,
            placeholderColor: Colors.black,
          ),
        ),

        const SizedBox(height: 20),

        // Name
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 5,
            children: [
              BigTitle(text: person.name),
              Text(
                person.knownForDepartment,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: ProjectColors(context).label,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
