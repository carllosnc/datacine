import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/components/components.dart';
import '/data/data.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '/notifiers/notifiers.dart';

class GenreFilter extends StatefulWidget {
  final MediaType mediaType;
  final Function(String? value) onChanged;

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

  final FilterNotifier filterNotifier = FilterNotifier();

  List<num> filteredGenres = [];
  @override
  void initState() {
    super.initState();
    dynamic currentFilters = "";

    // get genres from api
    getMovieGenres = genresRepository.getGenres(
      mediaType: widget.mediaType,
    );

    // set current filters to list
    if (widget.mediaType == MediaType.movie) {
      currentFilters = filterNotifier.movieFilters.value['genres'];
    }

    // set current filters to list
    if (widget.mediaType == MediaType.tv) {
      currentFilters = filterNotifier.tvShowFilters.value['genres'];
    }

    // set filters to list if not null
    if (currentFilters != null) {
      currentFilters.split(',').forEach((element) {
        filteredGenres.add(num.parse(element));
      });
    }
  }

  // set genres to filter list and remove if unselected
  setGenres(Genre genre, bool value) {
    setState(() {
      if (value) {
        filteredGenres.add(genre.id!);
      } else {
        filteredGenres.remove(genre.id!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getMovieGenres,
      builder: (
        BuildContext context,
        AsyncSnapshot<(List<Genre>, http.Response)> snapshot,
      ) {
        // if snapshot is null or waiting return loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }

        var (List<Genre> genres, _) = snapshot.data!;

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
                      label: Text(
                        genre.name!,
                        style: const TextStyle(fontSize: 12),
                      ),
                      selected: filteredGenres.contains(genre.id),
                      onSelected: (bool value) {
                        setGenres(genre, value);

                        if (filteredGenres.isEmpty) {
                          widget.onChanged(null);
                          return;
                        }

                        widget.onChanged(filteredGenres.join(','));
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
