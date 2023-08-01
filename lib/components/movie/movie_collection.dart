import 'package:flutter/material.dart';
import '/core/core.dart';
import '/domain/domain.dart';
import '/components/components.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;

class MovieCollection extends StatelessWidget {
  final MovieDetails movie;

  const MovieCollection({
    super.key,
    required this.movie,
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

          if (snapshot.hasError || collection.parts == null) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ErrorText(message: 'Error to loading collection'),
            );
          }

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
                    SectionTitle(text: movie.belongsToCollection!.name!),
                    Text(
                      '${collection.parts?.length} movies',
                      style: TextStyle(
                        fontSize: 12,
                        color: ProjectColors(context).label,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 365,
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

                    return MovieCollectionCard(movie: movie);
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
