import 'package:flutter/material.dart';
import 'package:imgy/imgy.dart';
import 'package:vw/vw_column.dart';
import '/imports.dart';

class PersonHeader extends StatelessWidget {
  final PersonDto person;

  const PersonHeader({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    var profileImage = ImageHelper.getProfile(
      path: person.profilePath,
      size: ImageSize.profileOriginal,
    );

    return VWColumn(
      horizontalAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(
              AppColors.imageFilter,
              BlendMode.color,
            ),
            child: Imgy(
              width: 200,
              height: 200 * 1.5,
              src: profileImage,
              fullSrc: profileImage,
              placeholderColor: Colors.black,
            ),
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
              Text(
                person.knownForDepartment,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.label,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
