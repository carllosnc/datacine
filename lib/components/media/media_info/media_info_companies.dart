import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vw/vw_column.dart';
import '/imports.dart';

class Companies extends StatelessWidget {
  final MovieDto? movie;
  final TvShowDto? tvShow;

  const Companies({
    super.key,
    this.movie,
    this.tvShow,
  });

  @override
  Widget build(BuildContext context) {
    // get the production companies from the movie or tv show
    List<Company>? productionCompanies = movie?.productionCompanies ?? tvShow?.productionCompanies;

    // if there are no production companies, return an empty SizedBox
    if (productionCompanies == null || productionCompanies.isEmpty) {
      return const SizedBox.shrink();
    }

    return VWColumn(
      gap: 10,
      children: [
        Text(
          "Companies",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.label,
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (var company in productionCompanies)
              LinkButton(
                onPressed: () {
                  context.push('/company', extra: company);
                },
                label: company.name!,
              )
          ],
        ),
      ],
    );
  }
}
