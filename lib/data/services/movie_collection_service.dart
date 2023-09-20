import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/imports/app.dart';

mixin MovieCollectionService<T extends StatefulWidget> on State<T> {
  final collectionRepository = MovieCollectionRepository(http.Client());

  bool isLoading = true;
  bool isError = false;
  bool isEmpty = false;
  late Collection collection;

  fetchMovieCollection({required String id}) async {
    try {
      var (Collection movieCollection, _) =
          await collectionRepository.getCollection(id: id);

      movieCollection.parts!.sort((a, b) {
        return a.releaseDate!.compareTo(b.releaseDate!);
      });

      movieCollection.parts!
          .removeWhere((element) => element.posterPath == null);

      if (movieCollection.parts == null) {
        setState(() {
          isEmpty = true;
        });
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
}
