import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports.dart';

class GenreFilter extends StatefulWidget {
  const GenreFilter({super.key});

  @override
  State<GenreFilter> createState() => _GenreFilterState();
}

class _GenreFilterState extends State<GenreFilter>
    with GenreFilterService, SharedState {
  @override
  initState() {
    super.initState();

    fetchGenre(MediaType.movie);
  }

  Widget content() {
    return ListView.builder(
      itemCount: genres.length,
      itemBuilder: (context, index) {
        Genre genre = genres[index];

        return ListTile(
          onTap: () {
            movieFilterState.setGenres(genre);
            Navigator.pop(context);
          },
          leading: Icon(
            Icons.movie,
            color: Colors.white.withOpacity(0.2),
          ),
          title: Text("${genre.name}"),
        );
      },
    );
  }

  Widget contentLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VWButton(
      label: movieFilterState.genre != null
          ? "Genre: ${movieFilterState.genre?.name}"
          : "All genres",
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      movieFilterState.setGenres(null);
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ],
                title: Text(
                  isLoading ? "Loading..." : "Genre filter",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              body: isLoading ? contentLoading() : content(),
            );
          },
        );
      },
    );
  }
}
