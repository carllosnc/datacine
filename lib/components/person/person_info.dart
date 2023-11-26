import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

class PersonInfo extends StatelessWidget {
  final PersonDto person;

  const PersonInfo({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: VWColumn(
        horizontalAlignment: CrossAxisAlignment.start,
        gap: 25,
        children: [
          if (person.hasBirthday)
            infoItem(
              context: context,
              label: "Birthday",
              text: person.birthday,
            ),
          if (person.hasDeathday)
            infoItem(
              context: context,
              label: "Deathday",
              text: person.deathday,
            ),
          if (person.hasPlaceOfBirth)
            infoItem(
              context: context,
              label: "Place of birth",
              text: person.placeOfBirth,
            ),
          if (person.hasBiography)
            infoItem(
              context: context,
              label: "Biography",
              text: person.biography,
            ),
        ],
      ),
    );
  }

  Widget infoItem({
    required BuildContext context,
    required String label,
    required String text,
  }) {
    return VWColumn(
      gap: 7,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Label(text: label),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: ProjectColors(context).text,
          ),
        ),
      ],
    );
  }
}
