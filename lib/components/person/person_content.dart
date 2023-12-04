import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
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
        child: VWColumn(
          horizontalAlignment: CrossAxisAlignment.center,
          children: [
            PersonHeader(person: person),

            SectionDivider(
              condition: person.hasMovieCast || person.hasMovieCrew || person.hasTvCast || person.hasTvCrew,
            ),

            VWColumn(
              gap: 10,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                if (person.hasMovieCast)
                  VWButton(
                    label: 'Movie cast',
                    leftIcon: Icons.local_movies_outlined,
                    horizontalAlignment: MainAxisAlignment.start,
                    color: AppColors.buttonColor,
                    onTap: () {
                      showMediaCredit(
                        context,
                        person.movieCast,
                        MediaType.movie,
                        "Movie Cast",
                      );
                    },
                  ),
                if (person.hasMovieCrew)
                  VWButton(
                    label: 'Movie crew',
                    leftIcon: Icons.movie_outlined,
                    horizontalAlignment: MainAxisAlignment.start,
                    color: AppColors.buttonColor,
                    onTap: () {
                      showMediaCredit(
                        context,
                        person.movieCrew,
                        MediaType.movie,
                        "Movie Crew",
                      );
                    },
                  ),
                if (person.hasTvCast)
                  VWButton(
                    label: 'TV cast',
                    leftIcon: Icons.live_tv,
                    horizontalAlignment: MainAxisAlignment.start,
                    color: AppColors.buttonColor,
                    onTap: () {
                      showMediaCredit(
                        context,
                        person.tvCast,
                        MediaType.tv,
                        "TV Cast",
                      );
                    },
                  ),
                if (person.hasTvCrew)
                  VWButton(
                    label: 'TV crew',
                    leftIcon: Icons.tv,
                    horizontalAlignment: MainAxisAlignment.start,
                    color: AppColors.buttonColor,
                    onTap: () {
                      showMediaCredit(
                        context,
                        person.tvCrew,
                        MediaType.tv,
                        "TV Crew",
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
