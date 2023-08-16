import 'package:flutter/material.dart';
import '/core/core.dart';
import '/dto/dto.dart';

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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (movie != null) movieOverview(context),
          if (tvshow != null) tvShowOverview(context),
        ],
      ),
    );
  }

  Wrap tvShowOverview(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 40;

    return Wrap(
      runSpacing: 10,
      children: [
        if (tvshow!.hasTagline)
          SizedBox(
            width: width,
            child: Text(
              '"${tvshow?.tagline}"',
              style: TextStyle(
                fontSize: 16,
                color: ProjectColors(context).featured,
              ),
            ),
          ),
        if (tvshow!.hasOverview)
          SizedBox(
            width: width,
            child: Text(
              '${tvshow?.overview}',
              style: TextStyle(
                fontSize: 16,
                color: ProjectColors(context).text,
              ),
            ),
          ),
      ],
    );
  }

  Wrap movieOverview(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 40;

    return Wrap(
      direction: Axis.vertical,
      spacing: 10,
      runSpacing: 10,
      children: [
        if (movie!.hasTagline)
          SizedBox(
            width: width,
            child: Text(
              '"${movie!.tagline}"',
              style: TextStyle(
                fontSize: 16,
                color: ProjectColors(context).featured,
              ),
            ),
          ),
        if (movie!.hasOverview)
          SizedBox(
            width: width,
            child: Text(
              movie!.overview,
              style: TextStyle(
                fontSize: 16,
                color: ProjectColors(context).text,
              ),
            ),
          ),
      ],
    );
  }
}
