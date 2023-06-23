import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/data/data.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '/components/components.dart';
import 'package:http/http.dart' as http;

class CustomSearchDelegate extends SearchDelegate {
  final _searchRepository = SearchRepository(http.Client());

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black.withOpacity(0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ChoiceChip(
                label: const DS1Text('Movies', fontSize: 12),
                selected: true,
                onSelected: (bool value) {},
              ),
              const SizedBox(width: 5),
              ChoiceChip(
                label: const DS1Text('TVShow', fontSize: 12),
                selected: false,
                onSelected: (bool value) {},
              ),
              const SizedBox(width: 5),
              ChoiceChip(
                label: const DS1Text('People', fontSize: 12),
                selected: false,
                onSelected: (bool value) {},
              ),
              const SizedBox(width: 5),
              ChoiceChip(
                label: const DS1Text('Company', fontSize: 12),
                selected: false,
                onSelected: (bool value) {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final searchKey = _searchRepository.sugestions(query: query, page: 1);

    if (query.isEmpty) {
      return const SizedBox.shrink();
    }

    return FutureBuilder(
      future: Future.delayed(
        const Duration(milliseconds: 500),
        () => searchKey,
      ),
      builder: (BuildContext context, AsyncSnapshot<SearchResult> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LinearProgressIndicator(minHeight: 0.8);
        }

        SearchResult data = snapshot.data!;

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
                title: DS1Text(
                  item.title ?? item.name ?? '-',
                  fontSize: 13,
                ),
                subtitle: DS1Text(
                  "${(item.releaseDate ?? item.firstAirDate!).formatYear()} — ${item.mediaType!.capitalize()}",
                  fontSize: 13,
                  fontColor: ProjectColors(context).featured,
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
                title: DS1Text(item.name!, fontSize: 13),
                subtitle: DS1Text(
                  item.knownForDepartment ?? '―',
                  fontSize: 13,
                  fontColor: Colors.yellow,
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
