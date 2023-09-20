import 'package:flutter/material.dart';
import './search_result.dart';
import './search_sugestions.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 0,
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  close(BuildContext context, result) {
    Navigator.pop(context);
    super.close(context, result);
  }

  @override
  String get searchFieldLabel => "Search...";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SearchResult(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const SizedBox.shrink();
    }

    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 300)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }

        return SearchSugestions(query: query);
      },
    );
  }
}
