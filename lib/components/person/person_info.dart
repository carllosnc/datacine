import 'package:flutter/material.dart';
import '/imports/app.dart';

class PersonInfo extends StatelessWidget {
  final PersonDto person;

  const PersonInfo({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        alignment: Alignment.topLeft,
        child: Wrap(
          direction: Axis.vertical,
          spacing: 25,
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
      ),
    );
  }

  Wrap infoItem({
    required BuildContext context,
    required String label,
    required String text,
  }) {
    double width = MediaQuery.of(context).size.width - 40;

    return Wrap(
      direction: Axis.vertical,
      spacing: 7,
      children: [
        Label(text: label),
        SizedBox(
          width: width,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: ProjectColors(context).text,
            ),
          ),
        ),
      ],
    );
  }
}
