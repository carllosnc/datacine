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
          child: SizedBox(
            height: 200 * 1.5,
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  widget.person.profilePath == null
                      ? ProjectColors(context).imageFilter
                      : ProjectColors(context).profileFilter,
                  BlendMode.color,
                ),
                child: ImageComponent(
                  imagePath: (widget.person.profilePath),
                  imageType: ImageType.profile,
                  imageSize: ImageSize.profileOriginal,
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
            spacing: 5,
            children: [
              BigTitle(text: widget.person.name!),
              Text(
                widget.person.knownForDepartment ?? '—',
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
