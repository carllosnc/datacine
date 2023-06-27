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

    if (productionCompanies == null || productionCompanies.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Companies",
            style: TextStyle(
              fontSize: 14,
              color: ProjectColors(context).label,
            ),
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (var company in productionCompanies)
                Wrap(
                  spacing: 5,
                  children: [
                    Text(
                      company.name!,
                      style: TextStyle(
                        fontSize: 14,
                        color: ProjectColors(context).link,
                      ),
                    ),
                    if (company != productionCompanies.last)
                      Text(
                        '•',
                        style: TextStyle(
                          color: ProjectColors(context).text.withOpacity(0.2),
                        ),
                      )
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
