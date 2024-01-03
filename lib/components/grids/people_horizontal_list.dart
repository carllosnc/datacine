import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

class PersonHorizontalList extends StatelessWidget {
  final List<PersonItem>? list;
  final String title;

  const PersonHorizontalList({
    super.key,
    required this.list,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    if (list == null) {
      return const SizedBox.shrink();
    }

    if (list!.length < 3) {
      return const SizedBox.shrink();
    }

    List<PersonItem>? cutList = list;

    if (list!.length > 20) {
      cutList = list!.sublist(0, 20);
    }

    return VWColumn(
      gap: 15,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(text: title),
        ),
        SizedBox(
          height: 210,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            separatorBuilder: (context, index) => const SizedBox(width: 15),
            itemCount: cutList!.length,
            itemBuilder: (BuildContext context, int index) {
              final PersonItem personItem = cutList![index];

              return SizedBox(
                width: 120,
                child: PersonCard(personItem: personItem),
              );
            },
          ),
        ),
      ],
    );
  }
}
