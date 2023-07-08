import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class PersonHeader extends StatefulWidget {
  final PersonDetails person;

  const PersonHeader({super.key, required this.person});

  @override
  State<PersonHeader> createState() => _PersonHeaderState();
}

class _PersonHeaderState extends State<PersonHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Container(
            height: 200 * 1.5,
            width: 200,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: ProjectColors(context).featured,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  ProjectColors(context).imageFilter,
                  BlendMode.color,
                ),
                child: ImageComponent(
                  imagePath: (widget.person.profilePath),
                  imageType: ImageType.profile,
                  imageSize: ImageSize.profileH632,
                ),
              ),
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
            children: [
              Text(
                widget.person.name!,
                style: TextStyle(
                  fontSize: 20,
                  color: ProjectColors(context).title,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.person.knownForDepartment ?? '—',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: ProjectColors(context).featured,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
