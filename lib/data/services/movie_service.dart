import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '/imports/app.dart';

mixin MovieService<T extends StatefulWidget> on State<T> {
  final _mediaDetailsRepository = MediaDetailsRepository(http.Client());

  bool isLoading = true;
  bool isError = false;
  bool isCanceled = false;
  late MovieDto movie;

  Future<void> fetchMovie({required dynamic id}) async {
    try {
      var (movieDetail, _) = await _mediaDetailsRepository.getMovie(id: id);

      if (isCanceled) return;

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

  @override
  void dispose() {
    isCanceled = true;
    super.dispose();
  }
}
