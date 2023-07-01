import 'package:flutter/material.dart';
import 'package:giganoid_app/components/components.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';
import '/core/core.dart';

class GenreFilter extends StatefulWidget {
  final MediaType mediaType;
  final Function(dynamic value) onChanged;

  const GenreFilter({
    super.key,
    required this.mediaType,
    required this.onChanged,
  });

  @override
  State<GenreFilter> createState() => _GenreFilterState();
}

class _GenreFilterState extends State<GenreFilter> {
  final genresRepository = MediaGenreRepository(
    http.Client(),
  );

  late Future<(List<Genre>, http.Response)> getMovieGenres;

  List<num> filteredGenres = [];

  @override
  void initState() {
    super.initState();

    getMovieGenres = genresRepository.getGenres(
      mediaType: widget.mediaType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMovieGenres,
      builder: (
        BuildContext context,
        AsyncSnapshot<(List<Genre>, http.Response)> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        List<Genre> genres = snapshot.data!.$1;

        //filter chips of genres
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Genres: '),
              const SizedBox(height: 5),
              Wrap(
                spacing: 10,
                runSpacing: 0,
                children: [
                  for (var genre in genres)
                    FilterChip(
                      label: Text(genre.name!,
                          style: const TextStyle(fontSize: 12)),
                      selected: filteredGenres.contains(genre.id),
                      onSelected: (bool value) {
                        setState(() {
                          if (value) {
                            filteredGenres.add(genre.id!);
                          } else {
                            filteredGenres.remove(genre.id!);
                          }

                          widget.onChanged(filteredGenres.join(','));
                        });
                      },
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
