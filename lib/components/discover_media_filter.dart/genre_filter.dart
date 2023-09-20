import 'package:flutter/material.dart';
import '/imports/app.dart';

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

class _GenreFilterState extends State<GenreFilter> with GenreFilterService {
  @override
  void initState() {
    super.initState();
    fetchGenre(widget.mediaType);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: Loading(),
      );
    }

    if (isError) {
      return const Center(
        child: Text('Error loading genres'),
      );
    }

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
              for (var genre in genres) genreChip(genre),
            ],
          ),
        ],
      ),
    );
  }

  FilterChip genreChip(Genre genre) {
    return FilterChip(
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
    );
  }
}
