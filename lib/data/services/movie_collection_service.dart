import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/imports.dart';

mixin MovieCollectionService<T extends StatefulWidget> on State<T> {
  final collectionRepository = MovieCollectionRepository(http.Client());

  bool isLoading = true;
  bool isError = false;
  bool isEmpty = false;
  bool isCanceled = false;
  late Collection collection;

  fetchMovieCollection({required String id}) async {
    try {
      var (Collection movieCollection, _) = await collectionRepository.getCollection(id: id);

      if (isCanceled) return;

      movieCollection.parts!.sort((a, b) {
        return a.releaseDate!.compareTo(b.releaseDate!);
      });

      movieCollection.parts!.removeWhere((element) => element.posterPath == null);
      movieCollection.parts!.removeWhere((element) => element.releaseDate == "");

      if (movieCollection.parts == null) {
        setState(() {
          isEmpty = true;
        });
      }

      for (var element in movieCollection.parts!) {
        print(element.releaseDate);
      }

      setState(() {
        isLoading = false;
        collection = movieCollection;
      });
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    isCanceled = true;
    super.dispose();
  }
}
