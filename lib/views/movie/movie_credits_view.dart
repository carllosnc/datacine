import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/imports/components.dart';

class MovieCreditsView extends StatelessWidget {
  final MovieDetails movie;

  const MovieCreditsView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    if (movie.credits == null || movie.credits!.isEmpty) {
      return const EmptyView();
    }

    return MediaCreditsList(
      credits: movie.credits,
      title: movie.title!,
    );
  }
}
