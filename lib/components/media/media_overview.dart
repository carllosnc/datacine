import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import '/imports/app.dart';

class MediaOverview extends StatelessWidget {
  final MovieDto? movie;
  final TvShowDto? tvshow;

  const MediaOverview({
    super.key,
    this.movie,
    this.tvshow,
  });

  @override
  Widget build(BuildContext context) {
    return VWColumn(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        if (movie != null) movieOverview(context),
        if (tvshow != null) tvShowOverview(context),
      ],
    );
  }

  Widget tvShowOverview(BuildContext context) {
    return VWColumn(
      gap: 10,
      children: [
        if (tvshow!.hasTagline)
          Text(
            '"${tvshow?.tagline}"',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.link,
            ),
          ),
        if (tvshow!.hasOverview)
          Text(
            '${tvshow?.overview}',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.text,
            ),
          ),
      ],
    );
  }

  Widget movieOverview(BuildContext context) {
    return VWColumn(
      gap: 10,
      children: [
        if (movie!.hasTagline)
          Text(
            '"${movie!.tagline}"',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.link,
            ),
          ),
        if (movie!.hasOverview) MediumText(text: movie!.overview)
      ],
    );
  }
}
