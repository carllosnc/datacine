import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/core/core.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/data/data.dart';

class MovieCollection extends StatelessWidget {
  final MovieDetails movie;
  final double maxWidth;

  const MovieCollection({
    super.key,
    required this.movie,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    final CollectionService collectionService = CollectionService();
    num? id = movie.belongsToCollection?.id;

    if (id != null) {
      return FutureBuilder(
        future: collectionService.getCollection(id.toString()),
        builder: (BuildContext context, AsyncSnapshot<Collection> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 50,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
            );
          }

          Collection collection = snapshot.data!;

          collection.parts!.sort((a, b) {
            return a.releaseDate!.compareTo(b.releaseDate!);
          });

          collection.parts!
              .removeWhere((element) => element.posterPath == null);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  direction: Axis.vertical,
                  runSpacing: 10,
                  children: [
                    DS1Text(
                      (movie.belongsToCollection!.name) ?? '',
                      fontSize: 16,
                      fontColor: Colors.white,
                    ),
                    DS1Text(
                      '${collection.parts?.length} movies',
                      fontSize: 12,
                      fontColor: Colors.yellow,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 365,
                width: maxWidth,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 15);
                  },
                  itemCount: collection.parts!.length,
                  itemBuilder: (BuildContext context, int index) {
                    MediaItem movie = collection.parts![index];

                    return SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.go('/movie/${movie.id.toString()}');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                border: Border.all(
                                  color: Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              height: 200 * 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: ImageComponent(
                                  imagePath: movie.posterPath,
                                  imageType: ImageType.poster,
                                  imageSize: ImageSize.posterW342,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                DateHelper.format(movie.releaseDate),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.yellow,
                                ),
                              ),
                              const SizedBox(height: 1),
                              Text(
                                movie.title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 13,
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
        },
      );
    }

    return const SizedBox.shrink();
  }
}
