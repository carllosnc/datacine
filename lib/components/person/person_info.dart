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
          spacing: 20,
          children: [
            if (person.birthday != null)
              Wrap(
                direction: Axis.vertical,
                spacing: 5,
                children: [
                  Text(
                    "Birthday",
                    style: TextStyle(
                      color: ProjectColors(context).title,
                    ),
                  ),
                  Text(
                    person.birthday!.formatDateTime(),
                    style: TextStyle(
                      fontSize: 14,
                      color: ProjectColors(context).text,
                    ),
                  ),
                ],
              ),
            if (person.deathday != null)
              Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.vertical,
                spacing: 5,
                children: [
                  Text(
                    "Deathday",
                    style: TextStyle(
                      color: ProjectColors(context).title,
                    ),
                  ),
                  Text(
                    person.deathday!.formatDateTime(),
                    style: TextStyle(
                      fontSize: 14,
                      color: ProjectColors(context).text,
                    ),
                  ),
                ],
              ),
            if (person.placeOfBirth != null)
              Wrap(
                direction: Axis.vertical,
                spacing: 5,
                children: [
                  Text(
                    "Place of birth",
                    style: TextStyle(
                      color: ProjectColors(context).title,
                    ),
                  ),
                  Text(
                    person.placeOfBirth!,
                    style: TextStyle(
                      fontSize: 14,
                      color: ProjectColors(context).text,
                    ),
                  ),
                ],
              ),
            if (person.biography != null && person.biography!.isNotEmpty)
              Wrap(
                spacing: 5,
                direction: Axis.vertical,
                children: [
                  Text(
                    "Biography",
                    style: TextStyle(
                      color: ProjectColors(context).title,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Text(
                      person.biography!,
                      style: TextStyle(
                        fontSize: 14,
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
