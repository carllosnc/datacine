import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';

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
