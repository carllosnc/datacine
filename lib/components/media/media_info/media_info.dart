import 'package:flutter/material.dart';
import '/imports/components.dart';
import './media_info_item.dart';
import './media_info_companies.dart';
import '/dto/dto.dart';

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
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ModalHeader(
                  title: "Informations",
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (movie != null) movieInfo(),
                        if (tvShow != null) tvShowInfo()
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.description, size: 20),
    );
  }

  Column tvShowInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        Companies(tvShow: tvShow),
        MediaInfoGenres(tvshow: tvShow)
      ],
    );
  }

  Column movieInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
