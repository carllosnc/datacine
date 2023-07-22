import 'package:flutter/material.dart';
import 'package:datacine/core/constants/media_type.dart';
import '/components/components.dart';
import '/domain/domain.dart';

class PersonContent extends StatelessWidget {
  final PersonDetails person;

  const PersonContent({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    //check if person has credits
    bool hasCredits = [
          ...person.combinedCredits?['cast'] ?? [],
          ...person.combinedCredits?['crew'] ?? [],
        ].length >
        3;

    // check if person has images
    bool hasImages = (person.images?['profiles']?.isNotEmpty ?? false) &&
        (person.images!['profiles']!.length > 3);

    return Scaffold(
      appBar: AppBar(
        actions: [
          PersonExternalLinks(
            person: person,
          ),
        ],
        title: PageTitle(text: person.name!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            PersonHeader(person: person),
            const SectionDivider(),

            GridMenu(
              items: [
                GridMenuItem(
                  label: 'Movie Cast',
                  icon: Icons.movie_outlined,
                  onTap: () {
                    var cast = person.movieCredits?['cast'];
                    showMediaCredit(
                      context,
                      cast,
                      MediaType.movie,
                      "${person.name}: Movie Cast",
                    );
                  },
                ),
                GridMenuItem(
                  label: 'Movie Crew',
                  icon: Icons.movie_outlined,
                  onTap: () {
                    var crew = person.movieCredits?['crew'];
                    showMediaCredit(
                      context,
                      crew,
                      MediaType.movie,
                      "${person.name}: Movie Crew",
                    );
                  },
                ),
                GridMenuItem(
                  label: 'TV Cast',
                  icon: Icons.tv,
                  onTap: () {
                    var cast = person.tvCredits?['cast'];
                    showMediaCredit(
                      context,
                      cast,
                      MediaType.tv,
                      "${person.name}: TV Cast",
                    );
                  },
                ),
                GridMenuItem(
                  label: 'TV Crew',
                  icon: Icons.tv,
                  onTap: () {
                    var crew = person.tvCredits?['crew'];
                    showMediaCredit(
                      context,
                      crew,
                      MediaType.tv,
                      "${person.name}: TV Crew",
                    );
                  },
                ),
              ],
            ),

            const SectionDivider(),

            // known for
            if (hasCredits) PersonKnownFor(person: person),
            if (hasCredits) const SectionDivider(),

            // images
            if (hasImages) PersonImages(person: person),
            if (hasImages) const SectionDivider(),

            // info
            PersonInfo(person: person),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
