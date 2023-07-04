import 'package:flutter/material.dart';
import '/core/core.dart';

class PersonView extends StatelessWidget {
  const PersonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'People',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        body: const Center(
          child: Text('PeopleView'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: ProjectColors(context).label,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Details',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'Series',
            ),
          ],
        ));
  }
}
