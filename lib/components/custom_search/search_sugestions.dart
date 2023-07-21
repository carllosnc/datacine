import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '/data/data.dart';
import '/components/components.dart';
import 'package:http/http.dart' as http;

class SearchSugestions extends StatelessWidget {
  final String query;

  SearchSugestions({super.key, required this.query});

  final _searchRepository = SearchRepository(http.Client());

  @override
  Widget build(BuildContext context) {
    final getSugestions =
        _searchRepository.getSugestions(query: query, page: 1);

    return FutureBuilder(
      future: Future.delayed(
        const Duration(milliseconds: 500),
        () => getSugestions,
      ),
      builder: (BuildContext context,
          AsyncSnapshot<(SearchResult, http.Response)> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LinearProgressIndicator(minHeight: 3);
        }

        if (snapshot.hasError) {
          return const ErrorBlock();
        }

        var (SearchResult data, _) = snapshot.data!;

        if (data.results!.isEmpty) {
          return const Empty(message: 'No results found');
        }

        return ListView.builder(
          itemCount: data.results!.length,
          itemBuilder: (BuildContext context, int index) {
            dynamic item = data.results![index];

            if (item is MediaItem) {
              return ListTile(
                onTap: () {
                  context.push(
                    '/${item.mediaType}/${item.id.toString()}',
                  );
                },
                trailing: const Icon(Icons.chevron_right),
                leading: SizedBox(
                  width: 35,
                  height: 35 * 1.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: ImageComponent(
                      imageSize: ImageSize.posterW154,
                      imagePath: item.posterPath,
                      imageType: ImageType.poster,
                    ),
                  ),
                ),
                title: Text(
                  item.title ?? item.name ?? '-',
                  style: TextStyle(
                    fontSize: 16,
                    color: ProjectColors(context).text,
                  ),
                ),
                subtitle: Text(
                  "${(item.releaseDate ?? item.firstAirDate!).formatYear()} — ${item.mediaType!.capitalize()}",
                  style: TextStyle(
                    fontSize: 14,
                    color: ProjectColors(context).featured,
                  ),
                ),
              );
            }

            if (item is PersonItem) {
              return ListTile(
                onTap: () {
                  context.push('/person/${item.id}');
                },
                trailing: const Icon(Icons.chevron_right),
                leading: SizedBox(
                  width: 35,
                  height: 45,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: ImageComponent(
                      imageSize: ImageSize.posterW154,
                      imagePath: item.profilePath,
                      imageType: ImageType.profile,
                    ),
                  ),
                ),
                title: Text(
                  item.name!,
                  style: TextStyle(
                    fontSize: 16,
                    color: ProjectColors(context).text,
                  ),
                ),
                subtitle: Text(
                  item.knownForDepartment ?? '―',
                  style: TextStyle(
                    fontSize: 14,
                    color: ProjectColors(context).featured,
                  ),
                ),
              );
            }
            return null;
          },
        );
      },
    );
  }
}
