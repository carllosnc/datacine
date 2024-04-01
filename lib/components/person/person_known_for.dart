import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';

class PersonKnownFor extends StatelessWidget {
  final PersonDto person;

  const PersonKnownFor({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return VWColumn(
      gap: 20,
      children: [
        //title
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(text: "Known For"),
        ),

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
            itemCount: person.knownForCredits.length,
            itemBuilder: (BuildContext context, int index) {
              MediaItem media = person.knownForCredits[index];

              MediaType mediaType = media.mediaType == 'movie' ? MediaType.movie : MediaType.tv;

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
