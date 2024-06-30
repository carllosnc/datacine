import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/imports.dart';

mixin TvShowService<T extends StatefulWidget> on State<T> {
  final _mediaDetailsRepository = MediaDetailsRepository(http.Client());

  bool isLoading = true;
  bool isError = false;
  bool isCanceled = false;
  late TvShowDto tvShow;

  Future<void> fetchTvShow({required dynamic id}) async {
    try {
      var (tvShowDetail, _) = await _mediaDetailsRepository.getTvShow(id: id);

      if (isCanceled) return;

      setState(() {
        tvShow = TvShowDto(tvShowDetail);
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
