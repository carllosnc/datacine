import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports.dart';

mixin SearchSuggestionService<T extends StatefulWidget> on State<T> {
  final _searchRepository = SearchRepository(http.Client());

  bool isLoading = true;
  bool isError = false;
  late SearchResult suggestions;
  bool isEmpty = false;

  fetchSuggestions({required String query, required int page}) async {
    try {
      var (SearchResult data, _) = await _searchRepository.getSuggestions(
        query: query,
        page: page,
      );

      if (data.results!.isEmpty) {
        setState(() {
          isEmpty = true;
        });
      }

      setState(() {
        isLoading = false;
        suggestions = data;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }
}
