import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;
import '/core/core.dart';
import '/components/components.dart';

class KeywordView extends StatelessWidget {
  final Keyword keyword;
  final MediaType mediaType;

  const KeywordView({
    super.key,
    required this.keyword,
    required this.mediaType,
  });

  Future<MediaList> fetchData({required int page}) async {
    var mediaDiscoverRepository = MediaDiscoverRepository(
      http.Client(),
    );

    var (companyMovies, _) =
        await mediaDiscoverRepository.discoverMoviesByKeyword(
      page: page,
      mediaType: mediaType,
      keywordId: keyword.id!,
    );

    return companyMovies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${mediaType.value.toUpperCase()}: ${keyword.name!}",
          style: const TextStyle(fontSize: 14),
        ),
      ),
      body: MediaInfinityGrid(
        key: PageStorageKey(keyword.id),
        fetchData: fetchData,
        mediaType: mediaType,
      ),
    );
  }
}
