import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/components/components.dart';

class TvShowCreditsView extends StatelessWidget {
  final TvShowDetails tvshow;

  const TvShowCreditsView({
    super.key,
    required this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    return MediaCreditsList(
      credits: tvshow.credits,
      title: tvshow.name!,
    );
  }
}
