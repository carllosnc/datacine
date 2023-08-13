import 'package:datacine/imports/components.dart';
import 'package:flutter/material.dart';
import '/core/core.dart';
import '/domain/domain.dart';

class PersonInfo extends StatelessWidget {
  final PersonDetails person;

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
            if (person.birthday != null)
              Wrap(
                direction: Axis.vertical,
                spacing: 7,
                children: [
                  const Label(text: "Birthday"),
                  Text(
                    person.birthday!.formatDateTime(),
                    style: TextStyle(
                      fontSize: 16,
                      color: ProjectColors(context).text,
                    ),
                  ),
                ],
              ),
            if (person.deathday != null)
              Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.vertical,
                spacing: 7,
                children: [
                  const Label(text: "Deathday"),
                  Text(
                    person.deathday!.formatDateTime(),
                    style: TextStyle(
                      fontSize: 16,
                      color: ProjectColors(context).text,
                    ),
                  ),
                ],
              ),
            if (person.placeOfBirth != null)
              Wrap(
                direction: Axis.vertical,
                spacing: 7,
                children: [
                  const Label(text: "Place of birth"),
                  Text(
                    person.placeOfBirth!,
                    style: TextStyle(
                      fontSize: 16,
                      color: ProjectColors(context).text,
                    ),
                  ),
                ],
              ),
            if (person.biography != null && person.biography!.isNotEmpty)
              Wrap(
                spacing: 7,
                direction: Axis.vertical,
                children: [
                  const Label(text: "Biography"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      person.biography!,
                      style: TextStyle(
                        fontSize: 16,
                        color: ProjectColors(context).text,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
