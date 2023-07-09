import 'package:flutter/material.dart';
import 'package:giganoid_app/core/constants/media_type.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;
import '/components/components.dart';

class CompanyMovieTabs extends StatelessWidget {
  final Company company;
  final MediaType mediaType;

  const CompanyMovieTabs({
    super.key,
    required this.company,
    required this.mediaType,
  });

  Future<MediaList> fetchData({required int page}) async {
    var mediaDiscoverRepository = MediaDiscoverRepository(
      http.Client(),
    );

    var (companyMovies, _) =
        await mediaDiscoverRepository.discoverMoviesByCompany(
      page: page,
      mediaType: mediaType,
      companyId: company.id,
    );

    return companyMovies;
  }

  @override
  Widget build(BuildContext context) {
    return MediaInfinityGrid(
      fetchData: fetchData,
      mediaType: mediaType,
    );
  }
}
