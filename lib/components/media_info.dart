import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';

class _Item extends StatelessWidget {
  final bool condition;
  final String label;
  final String item;

  const _Item({
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

class Companies extends StatelessWidget {
  final MovieDetails? movie;
  final TvShowDetails? tvShow;

  const Companies({
    super.key,
    this.movie,
    this.tvShow,
  });

  @override
  Widget build(BuildContext context) {
    List<ProductionCompany>? productionCompanies =
        movie?.productionCompanies ?? tvShow?.productionCompanies;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DS1Text(
            "Companies",
            fontSize: 14,
            fontColor: ProjectColors(context).label,
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var company in productionCompanies!)
                Wrap(
                  children: [
                    DS1Text(
                      company.name!,
                      fontSize: 14,
                      fontColor: ProjectColors(context).link,
                    ),
                    if (company != productionCompanies.last)
                      DS1Text(
                        ',',
                        fontSize: 14,
                        fontColor: ProjectColors(context).text,
                      ),
                  ],
                ),
            ],
          ),
        ],
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
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.fromLTRB(0, 15, 15, 5),
                  width: double.infinity,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
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
                              _Item(
                                condition: movie!.originalTitle != null,
                                item: movie!.originalTitle!,
                                label: "Original title",
                              ),
                              _Item(
                                condition: movie!.runtime != null &&
                                    movie!.runtime! > 0,
                                item: "${movie!.runtime!} Minutes",
                                label: "Runtime in minutes",
                              ),
                              _Item(
                                condition: movie!.productionCountries != null &&
                                    movie!.productionCountries!.isNotEmpty,
                                item: movie!.productionCountries!
                                    .map((e) => e.name)
                                    .join(", "),
                                label: "Production Countries",
                              ),
                              _Item(
                                condition: movie!.spokenLanguages != null &&
                                    movie!.spokenLanguages!.isNotEmpty,
                                item: movie!.spokenLanguages!
                                    .map((e) => e.name)
                                    .join(", "),
                                label: "Spoken Languages",
                              ),
                              _Item(
                                condition:
                                    movie!.budget != null && movie!.budget! > 0,
                                item: formatMoney(movie!.budget!.toString()),
                                label: "Budget",
                              ),
                              _Item(
                                condition: movie!.revenue != null &&
                                    movie!.revenue! > 0,
                                item: formatMoney(movie!.revenue!.toString()),
                                label: "Revenue",
                              ),
                              _Item(
                                condition: movie!.status != null,
                                item: movie!.status!,
                                label: "Status",
                              ),
                              Companies(movie: movie),
                            ],
                          ),
                        if (tvShow != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _Item(
                                condition: tvShow!.originalName != null,
                                item: tvShow!.originalName!,
                                label: "Original title",
                              ),
                              _Item(
                                condition:
                                    tvShow!.productionCountries != null &&
                                        tvShow!.productionCountries!.isNotEmpty,
                                item: tvShow!.productionCountries!
                                    .map((e) => e.name)
                                    .join(", "),
                                label: "Production Countries",
                              ),
                              _Item(
                                condition: tvShow!.spokenLanguages != null &&
                                    tvShow!.spokenLanguages!.isNotEmpty,
                                item: tvShow!.spokenLanguages!
                                    .map((e) => e.name)
                                    .join(", "),
                                label: "Spoken Languages",
                              ),
                              _Item(
                                condition: tvShow!.status != null,
                                item: tvShow!.status!,
                                label: "Status",
                              ),
                              _Item(
                                condition: tvShow!.numberOfSeasons != null,
                                item: tvShow!.numberOfSeasons!.toString(),
                                label: "Number of seasons",
                              ),
                              _Item(
                                condition: tvShow!.numberOfEpisodes != null,
                                item: tvShow!.numberOfEpisodes!.toString(),
                                label: "Number of episodes",
                              ),
                              Companies(tvShow: tvShow),
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
