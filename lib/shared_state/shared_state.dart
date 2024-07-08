import 'package:flutter/material.dart';
import 'movie_filter_state.dart';
import 'tvshow_filter_state.dart';

mixin SharedState<T extends StatefulWidget> on State<T> {
  @override
  void initState() {
    movieFilterState.addListener(action);
    tvShowFilterState.addListener(action);
    super.initState();
  }

  @override
  void dispose() {
    movieFilterState.removeListener(action);
    tvShowFilterState.removeListener(action);
    super.dispose();
  }

  void action() {
    setState(() {});
  }
}
