import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/core/core.dart';

class PersonHorizontalList extends StatelessWidget {
  final List<PersonItem>? list;
  final double maxWidth;
  final String title;

  const PersonHorizontalList({
    super.key,
    required this.list,
    required this.maxWidth,
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: ProjectColors(context).title,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: maxWidth,
          height: 210,
          color: Colors.transparent,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
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
