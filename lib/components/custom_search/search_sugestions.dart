import 'package:flutter/material.dart';
import '/imports/app.dart';

class SearchSugestions extends StatefulWidget {
  final String query;

  const SearchSugestions({
    super.key,
    required this.query,
  });

  @override
  State<SearchSugestions> createState() => _SearchSugestionsState();
}

class _SearchSugestionsState extends State<SearchSugestions>
    with SearchSugestionService {
  @override
  Widget build(BuildContext context) {
    fetchSugestions(query: widget.query, page: 1);

    if (isLoading) {
      return const Loading();
    }

    if (isError) {
      return const ErrorText(
        message: 'Error while fetching sugestions',
      );
    }

    if (isEmpty) {
      return const Empty(
        message: 'No results found',
      );
    }

    return ListView.builder(
      itemCount: sugestions.results!.length,
      itemBuilder: (BuildContext context, int index) {
        dynamic item = sugestions.results![index];

        if (item is MediaItem) {
          return MediaListTile(item: item);
        }

        if (item is PersonItem) {
          return PersonListTile(person: item);
        }

        return null;
      },
    );
  }
}
