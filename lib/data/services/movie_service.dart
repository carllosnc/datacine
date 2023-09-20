import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/imports/app.dart';

mixin MovieService<T extends StatefulWidget> on State<T> {
  final _mediaDetailsRepository = MediaDetailsRepository(http.Client());

  bool isLoading = true;
  bool isError = false;
  late MovieDto movie;

  Future<void> fetchMovie({required dynamic id}) async {
    var (movieDetail, _) = await _mediaDetailsRepository.getMovie(id: id);

    try {
      setState(() {
        movie = MovieDto(movieDetail);
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }
}
