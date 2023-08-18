import 'package:flutter/material.dart';
import '/imports/app.dart';

class PersonContent extends StatelessWidget {
  final PersonDto person;

  const PersonContent({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          PersonExternalLinks(
            person: person,
          ),
        ],
        title: PageTitle(title: person.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PersonHeader(person: person),

            const SectionDivider(),

            GridMenu(
              items: [
                if (person.hasMovieCast)
                  GridMenuItem(
                    label: 'Movie cast',
                    icon: Icons.local_movies,
                    onTap: () {
                      showMediaCredit(
                        context,
                        person.movieCast,
                        MediaType.movie,
                        "${person.name}: Movie Cast",
                      );
                    },
                  ),
                if (person.hasMovieCrew)
                  GridMenuItem(
                    label: 'Movie crew',
                    icon: Icons.movie,
                    onTap: () {
                      showMediaCredit(
                        context,
                        person.movieCrew,
                        MediaType.movie,
                        "${person.name}: Movie Crew",
                      );
                    },
                  ),
                if (person.hasTvCast)
                  GridMenuItem(
                    label: 'TV cast',
                    icon: Icons.live_tv,
                    onTap: () {
                      showMediaCredit(
                        context,
                        person.tvCast,
                        MediaType.tv,
                        "${person.name}: TV Cast",
                      );
                    },
                  ),
                if (person.hasTvCrew)
                  GridMenuItem(
                    label: 'TV crew',
                    icon: Icons.tv,
                    onTap: () {
                      showMediaCredit(
                        context,
                        person.tvCrew,
                        MediaType.tv,
                        "${person.name}: TV Crew",
                      );
                    },
                  ),
              ],
            ),

            // known for
            SectionDivider(condition: person.hasCredits),
            if (person.hasCredits) PersonKnownFor(person: person),

            // images
            SectionDivider(condition: person.hasProfileImages),
            if (person.hasProfileImages) PersonImages(person: person),

            // info
            SectionDivider(condition: person.hasInfo),
            if (person.hasInfo) PersonInfo(person: person),

            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
