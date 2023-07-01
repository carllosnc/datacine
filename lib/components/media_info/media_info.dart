import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '/components/components.dart';
import './media_info_item.dart';
import './media_info_companies.dart';

class MediaInfo extends StatelessWidget {
  final MovieDetails? movie;
  final TvShowDetails? tvShow;

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
                        if (movie != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MediaInfoItem(
                                condition: movie!.originalTitle != null,
                                item: movie!.originalTitle!,
                                label: "Original title",
                              ),
                              MediaInfoItem(
                                condition: movie!.runtime != null &&
                                    movie!.runtime! > 0,
                                item: "${movie!.runtime!} Minutes",
                                label: "Runtime in minutes",
                              ),
                              MediaInfoItem(
                                condition: movie!.productionCountries != null &&
                                    movie!.productionCountries!.isNotEmpty,
                                item: movie!.productionCountries!
                                    .map((e) => e.name)
                                    .join(", "),
                                label: "Production Countries",
                              ),
                              MediaInfoItem(
                                condition: movie!.spokenLanguages != null &&
                                    movie!.spokenLanguages!.isNotEmpty,
                                item: movie!.spokenLanguages!
                                    .map((e) => e.name)
                                    .join(", "),
                                label: "Spoken Languages",
                              ),
                              MediaInfoItem(
                                condition:
                                    movie!.budget != null && movie!.budget! > 0,
                                item: movie!.budget!.toString().formatMoney(),
                                label: "Budget",
                              ),
                              MediaInfoItem(
                                condition: movie!.revenue != null &&
                                    movie!.revenue! > 0,
                                item: movie!.revenue!.toString().formatMoney(),
                                label: "Revenue",
                              ),
                              MediaInfoItem(
                                condition: movie!.status != null,
                                item: movie!.status!,
                                label: "Status",
                              ),
                              Companies(movie: movie),
                              MediaInfoGenres(movie: movie),
                            ],
                          ),
                        if (tvShow != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MediaInfoItem(
                                condition: tvShow!.originalName != null,
                                item: tvShow!.originalName!,
                                label: "Original title",
                              ),
                              MediaInfoItem(
                                condition:
                                    tvShow!.productionCountries != null &&
                                        tvShow!.productionCountries!.isNotEmpty,
                                item: tvShow!.productionCountries!
                                    .map((e) => e.name)
                                    .join(", "),
                                label: "Production Countries",
                              ),
                              MediaInfoItem(
                                condition: tvShow!.spokenLanguages != null &&
                                    tvShow!.spokenLanguages!.isNotEmpty,
                                item: tvShow!.spokenLanguages!
                                    .map((e) => e.name)
                                    .join(", "),
                                label: "Spoken Languages",
                              ),
                              MediaInfoItem(
                                condition: tvShow!.status != null,
                                item: tvShow!.status!,
                                label: "Status",
                              ),
                              MediaInfoItem(
                                condition: tvShow!.numberOfSeasons != null,
                                item: tvShow!.numberOfSeasons!.toString(),
                                label: "Number of seasons",
                              ),
                              MediaInfoItem(
                                condition: tvShow!.numberOfEpisodes != null,
                                item: tvShow!.numberOfEpisodes!.toString(),
                                label: "Number of episodes",
                              ),
                              Companies(tvShow: tvShow),
                              MediaInfoGenres(tvshow: tvShow)
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.description_outlined),
    );
  }
}
