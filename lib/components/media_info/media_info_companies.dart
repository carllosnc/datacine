import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '/components/components.dart';

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
    // get the production companies from the movie or tv show
    List<ProductionCompany>? productionCompanies =
        movie?.productionCompanies ?? tvShow?.productionCompanies;

    // if there are no production companies, return an empty SizedBox
    if (productionCompanies == null || productionCompanies.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
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
          const SizedBox(height: 7),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (var company in productionCompanies)
                LinkButton(
                  onPressed: () {},
                  label: company.name!,
                )
            ],
          ),
        ],
      ),
    );
  }
}
