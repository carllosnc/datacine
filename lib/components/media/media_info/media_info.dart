import 'package:flutter/material.dart';
import 'package:vw/vw.dart';
import './media_info_item.dart';
import './media_info_companies.dart';
import '/imports/app.dart';

class MediaInfo extends StatelessWidget {
  final MovieDto? movie;
  final TvShowDto? tvShow;

  const MediaInfo({
    super.key,
    this.movie,
    this.tvShow,
  });

  @override
  Widget build(BuildContext context) {
    return VWButton(
      label: 'Info',
      horizontalAlignment: MainAxisAlignment.start,
      leftIcon: Icons.description_outlined,
      color: AppColors.buttonColor,
      onTap: () {
        VWPage.open(
          context: context,
          appBar: AppBar(
            title: const SectionTitle(
              text: "Informations",
            ),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: VWColumn(
              children: [
                if (movie != null) movieInfo(),
                if (tvShow != null) tvShowInfo(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget tvShowInfo() {
    return VWColumn(
      gap: 20,
      children: [
        MediaInfoItem(
          condition: tvShow!.hasOriginalName,
          item: tvShow!.originalName,
          label: "Original title",
        ),
        MediaInfoItem(
          condition: tvShow!.hasProductionCountries,
          item: tvShow!.productionCountries,
          label: "Production Countries",
        ),
        MediaInfoItem(
          condition: tvShow!.hasSpokenLanguages,
          item: tvShow!.spokenLanguages,
          label: "Spoken Languages",
        ),
        MediaInfoItem(
          condition: tvShow!.hasStatus,
          item: tvShow!.status,
          label: "Status",
        ),
        MediaInfoItem(
          condition: tvShow!.hasNumberOfSeasons,
          item: tvShow!.numberOfSeasons,
          label: "Number of seasons",
        ),
        MediaInfoItem(
          condition: tvShow!.hasNumberOfEpisodes,
          item: tvShow!.numberOfEpisodes,
          label: "Number of episodes",
        ),
        MediaInfoItem(
          condition: tvShow!.hasGenres,
          item: tvShow!.genres,
          label: "Genres",
        ),
        Companies(tvShow: tvShow),
      ],
    );
  }

  Widget movieInfo() {
    return VWColumn(
      gap: 20,
      children: [
        MediaInfoItem(
          condition: movie!.hasOriginalTitle,
          item: movie!.originalTitle!,
          label: "Original title",
        ),
        MediaInfoItem(
          condition: movie!.hasRuntime,
          item: movie!.runTime,
          label: "Runtime",
        ),
        MediaInfoItem(
          condition: movie!.hasProductionCountries,
          item: movie!.productionCountries,
          label: "Production Countries",
        ),
        MediaInfoItem(
          condition: movie!.hasSpokenLanguages,
          item: movie!.spokenLanguages,
          label: "Spoken Languages",
        ),
        MediaInfoItem(
          condition: movie!.hasBudget,
          item: movie!.budget,
          label: "Budget",
        ),
        MediaInfoItem(
          condition: movie!.hasRevenue,
          item: movie!.revenue,
          label: "Revenue",
        ),
        MediaInfoItem(
          condition: movie!.hasStatus,
          item: movie!.status,
          label: "Status",
        ),
        MediaInfoItem(
          condition: movie!.hasGenres,
          item: movie!.genres,
          label: "Genres",
        ),
        Companies(movie: movie),
      ],
    );
  }
}
