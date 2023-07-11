import 'package:flutter/material.dart';
import 'package:datacine/core/helpers/unique.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import 'image_component.dart';

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

    //order by vote count
    allCredits.sort((a, b) {
      return b.voteCount!.compareTo(a.voteCount!);
    });

    // remove duplicates
    allCredits = allCredits.unique((p1) => p1.id);

    //cut in 20 items
    allCredits = allCredits.take(20).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Known for',
            style: TextStyle(
              fontSize: 16,
              color: ProjectColors(context).title,
            ),
          ),
        ),

        const SizedBox(height: 10),

        SizedBox(
          height: 245,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 10);
            },
            itemCount: allCredits.length,
            itemBuilder: (BuildContext context, int index) {
              MediaItem media = allCredits[index];

              return SizedBox(
                width: 130,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context
                            .go('/${media.mediaType}/${media.id.toString()}');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                        height: 130 * 1.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: ImageComponent(
                            imagePath: media.posterPath,
                            imageType: ImageType.poster,
                            imageSize: ImageSize.posterW342,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          (media.releaseDate ?? media.firstAirDate!)
                              .formatDateTime(),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 11,
                            color: ProjectColors(context).featured,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          media.title ?? media.name!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 12,
                            color: ProjectColors(context).text,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
