import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';

class MovieCreditsView extends StatelessWidget {
  final MovieDetails movie;

  const MovieCreditsView({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return CreditsList(credits: movie.credits);
  }
}
