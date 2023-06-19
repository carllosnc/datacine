import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import 'package:giganoid_app/core/core.dart';
import '/domain/domain.dart';

class MediaInfoItem extends StatelessWidget {
  final bool condition;
  final String label;
  final String item;

  const MediaInfoItem({
    super.key,
    required this.item,
    required this.label,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: condition,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DS1Text(
              label,
              fontSize: 14,
              fontColor: ProjectColors(context).label,
            ),
            const SizedBox(height: 3),
            DS1Text(
              item,
              fontSize: 14,
            ),
          ],
        ),
      ),
    );
  }
}

class MediaInfo extends StatelessWidget {
  final MovieDetails? movie;
  final TvShowDetails? tvShow;

  const MediaInfo({
    super.key,
    this.movie,
    this.tvShow,
  });

  String formatMoney(String money) {
    return "\$$money".replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          builder: (context) {
            return SizedBox(
              height: 1000,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.transparent,
                    width: double.infinity,
                    height: 35,
                    child: Center(
                      child: Container(
                        width: 100,
                        height: 3,
                        decoration: BoxDecoration(
                          color: ProjectColors(context).label,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
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
                                  condition: movie!.productionCountries !=
                                          null &&
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
                                  condition: movie!.budget != null &&
                                      movie!.budget! > 0,
                                  item: formatMoney(movie!.budget!.toString()),
                                  label: "Budget",
                                ),
                                MediaInfoItem(
                                  condition: movie!.revenue != null &&
                                      movie!.revenue! > 0,
                                  item: formatMoney(movie!.revenue!.toString()),
                                  label: "Revenue",
                                ),
                                //status
                                MediaInfoItem(
                                  condition: movie!.status != null,
                                  item: movie!.status!,
                                  label: "Status",
                                ),
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
                                  condition: tvShow!.productionCountries !=
                                          null &&
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
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.description_outlined),
    );
  }
}
