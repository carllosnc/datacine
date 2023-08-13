import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import '/imports/components.dart';
import 'package:http/http.dart' as http;

class SearchSugestions extends StatelessWidget {
  final String query;

  SearchSugestions({super.key, required this.query});

  final _searchRepository = SearchRepository(http.Client());

  @override
  Widget build(BuildContext context) {
    final getSugestions =
        _searchRepository.getSugestions(query: query, page: 1);

    return FutureBuilder(
      future: Future.delayed(
        const Duration(milliseconds: 500),
        () => getSugestions,
      ),
      builder: (BuildContext context,
          AsyncSnapshot<(SearchResult, http.Response)> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LinearProgressIndicator(minHeight: 3);
        }

        if (snapshot.hasError) {
          return const ErrorBlock();
        }

        var (SearchResult data, _) = snapshot.data!;

        if (data.results!.isEmpty) {
          return const Empty(message: 'No results found');
        }

        return ListView.builder(
          itemCount: data.results!.length,
          itemBuilder: (BuildContext context, int index) {
            dynamic item = data.results![index];

            if (item is MediaItem) {
              return MediaListTile(item: item);
            }

            if (item is PersonItem) {
              return PersonListTile(person: item);
            }
            return null;
          },
        );
      },
    );
  }
}
