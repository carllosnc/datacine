import '/imports/components.dart';
import 'package:flutter/material.dart';
import 'package:datacine/core/helpers/unique.dart';
import '/domain/domain.dart';
import '/core/core.dart';

class PersonKnownFor extends StatelessWidget {
  final PersonDetails person;

  const PersonKnownFor({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    //get all cast and crew
    List<MediaItem> movies = person.combinedCredits?['cast'] ?? [];
    List<MediaItem> series = person.combinedCredits?['crew'] ?? [];

    // combine cast and crew
    List<MediaItem> allCredits = [...movies, ...series];

    if (allCredits.isNotEmpty) {
      allCredits.sort((a, b) {
        return b.voteCount!.compareTo(a.voteCount ?? 0);
      });
    }

    // remove duplicates
    allCredits = allCredits.unique((p1) => p1.id);

    //cut in 20 items
    allCredits = allCredits.take(20).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(text: "Known For"),
        ),

        const SizedBox(height: 20),

        SizedBox(
          height: 245,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 15);
            },
            itemCount: allCredits.length,
            itemBuilder: (BuildContext context, int index) {
              MediaItem media = allCredits[index];

              MediaType mediaType =
                  media.mediaType == 'movie' ? MediaType.movie : MediaType.tv;

              return SizedBox(
                width: 130,
                child: MiniMediaCard(
                  mediaItem: media,
                  mediaType: mediaType,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
