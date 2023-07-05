import 'package:flutter/material.dart';
import '/components/components.dart';
import '/domain/domain.dart';

class PersonDetailsTab extends StatelessWidget {
  final PersonDetails person;

  const PersonDetailsTab({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: Text(
          person.name!,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      body: Center(
        child: Text(
          person.name!,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      bottomNavigationBar: BottomMenu(
        items: [
          BottomItem(
            icon: Icons.movie,
            label: "Cast",
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return const Column(
                    children: [
                      ModalHeader(
                        title: "Movie Cast",
                      ),
                    ],
                  );
                },
              );
            },
          ),
          BottomItem(
            icon: Icons.movie,
            label: "Crew",
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return const Column(
                    children: [
                      ModalHeader(
                        title: "Movie Crew",
                      ),
                    ],
                  );
                },
              );
            },
          ),
          BottomItem(
            icon: Icons.tv,
            label: "Cast",
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return const Column(
                    children: [
                      ModalHeader(
                        title: "TV Cast",
                      ),
                    ],
                  );
                },
              );
            },
          ),
          BottomItem(
            icon: Icons.tv,
            label: "Crew",
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return const Column(
                    children: [
                      ModalHeader(
                        title: "Movie Crew",
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
