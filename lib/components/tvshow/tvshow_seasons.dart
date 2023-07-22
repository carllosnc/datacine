import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '/components/components.dart';

class TvShowSeasons extends StatelessWidget {
  final TvShowDetails? tvshow;
  final double maxWidth;

  const TvShowSeasons({
    super.key,
    required this.tvshow,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (tvshow == null || tvshow!.seasons == null || tvshow!.seasons!.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Season> seasons = tvshow!.seasons!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          direction: Axis.vertical,
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                seasons.length == 1
                    ? '· 1 Season'
                    : '· ${seasons.length} Seasons',
                style: TextStyle(
                  fontSize: 16,
                  color: ProjectColors(context).title,
                ),
              ),
            ),
            SizedBox(
              height: 365,
              width: maxWidth,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 15);
                },
                itemCount: seasons.length,
                itemBuilder: (BuildContext context, int index) {
                  Season season = seasons[index];

                  return SeasonCard(
                    tvshowId: tvshow!.id!,
                    season: season,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
