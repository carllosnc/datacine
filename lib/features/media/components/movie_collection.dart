import 'package:flutter/material.dart';
import 'package:vw/vw.dart';

import '/imports.dart';

class MovieCollection extends StatefulWidget {
  final MovieDto movie;

  const MovieCollection({
    super.key,
    required this.movie,
  });

  @override
  State<MovieCollection> createState() => _MovieCollectionState();
}

class _MovieCollectionState extends State<MovieCollection>
    with MovieCollectionService {
  @override
  void initState() {
    super.initState();
    int? id = widget.movie.belongsToCollection?.id;

    if (id != null) {
      fetchMovieCollection(id: id.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    num? id = widget.movie.belongsToCollection?.id;

    if (id == null || isEmpty) {
      return const SizedBox.shrink();
    }

    if (isLoading) {
      return const Loading();
    }

    if (isError) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ErrorText(
          message: "Error to load movie collection",
        ),
      );
    }

    return VWColumn(
      gap: 20,
      children: [
        VWColumn(
          gap: 5,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            SectionTitle(text: widget.movie.belongsToCollection!.name!),
            Text(
              '${collection.parts?.length} movies',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.label,
              ),
            )
          ],
        ),
        SizedBox(
          height: 278,
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

              return CardMovieCollection(movie: movie);
            },
          ),
        ),
      ],
    );
  }
}
