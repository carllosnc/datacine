import 'package:flutter/material.dart';
import '/dto/dto.dart';
import '/imports/components.dart';

class TvShowCreditsView extends StatelessWidget {
  final TvShowDto tvshow;

  const TvShowCreditsView({
    super.key,
    required this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    return MediaCreditsList(
      credits: tvshow.credits,
      title: tvshow.name,
    );
  }
}
