import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/core/core.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;

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
    num? id = movie.belongsToCollection?.id;

    final collectionRepository = MovieCollectionRepository(http.Client());
    final getColection = collectionRepository.getCollection(id: id.toString());

    if (id != null) {
      return FutureBuilder(
        future: getColection,
        builder: (BuildContext context,
            AsyncSnapshot<(Collection, http.Response)> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          }

          var (Collection collection, _) = snapshot.data!;

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
                    Text(
                      (movie.belongsToCollection!.name) ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: ProjectColors(context).title,
                      ),
                    ),
                    Text(
                      '${collection.parts?.length} movies',
                      style: TextStyle(
                        fontSize: 12,
                        color: ProjectColors(context).text,
                      ),
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
                              context.push('/movie/${movie.id.toString()}');
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
                                (movie.releaseDate ?? '').formatDateTime(),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ProjectColors(context).featured,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                movie.title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 13,
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
        },
      );
    }

    return const SizedBox.shrink();
  }
}
