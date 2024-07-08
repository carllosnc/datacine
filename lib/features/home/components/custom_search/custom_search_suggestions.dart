import 'package:flutter/material.dart';

import '/imports.dart';

class SearchSuggestions extends StatefulWidget {
  final String query;

  const SearchSuggestions({
    super.key,
    required this.query,
  });

  @override
  State<SearchSuggestions> createState() => _SearchSuggestionsState();
}

class _SearchSuggestionsState extends State<SearchSuggestions>
    with SearchSuggestionService {
  @override
  Widget build(BuildContext context) {
    fetchSuggestions(query: widget.query, page: 1);

    if (isLoading) {
      return const Loading();
    }

    if (isError) {
      return const ErrorText(
        message: 'Error while fetching suggestions',
      );
    }

    if (isEmpty) {
      return const Empty(
        message: 'No results found',
      );
    }

    return ListView.builder(
      itemCount: suggestions.results!.length,
      itemBuilder: (BuildContext context, int index) {
        dynamic item = suggestions.results![index];

        if (item is MediaItem) {
          return ListTileMedia(item: item);
        }

        if (item is PersonItem) {
          return ListTilePerson(person: item);
        }

        return null;
      },
    );
  }
}
