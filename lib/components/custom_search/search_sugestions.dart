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

        SearchResult data = snapshot.data!.$1;

        return ListView.builder(
          itemCount: data.results!.length,
          itemBuilder: (BuildContext context, int index) {
            dynamic item = data.results![index];

            if (item is MediaItem) {
              return ListTile(
                onTap: () {
                  context.go(
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
                  style: const TextStyle(fontSize: 13),
                ),
                subtitle: Text(
                  "${(item.releaseDate ?? item.firstAirDate!).formatYear()} — ${item.mediaType!.capitalize()}",
                  style: TextStyle(
                    fontSize: 13,
                    color: ProjectColors(context).featured,
                  ),
                ),
              );
            }

            if (item is PersonItem) {
              return ListTile(
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
                  style: const TextStyle(fontSize: 13),
                ),
                subtitle: Text(
                  item.knownForDepartment ?? '―',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.yellow,
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
