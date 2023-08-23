import 'package:flutter/material.dart';
import '/imports/app.dart';

import 'package:imgy/imgy.dart';

class MediaPosterGrid extends StatefulWidget {
  final List<ImageItem> posters;
  final String title;

  const MediaPosterGrid({
    super.key,
    required this.posters,
    required this.title,
  });

  @override
  State<MediaPosterGrid> createState() => _MediaPosterGridState();
}

class _MediaPosterGridState extends State<MediaPosterGrid> {
  //filter posters by language
  List<ImageItem> filteredPosters = [];
  List<ImageItem> posters = [];
  String selectedLang = 'All posters';
  Map<String, dynamic> supportedLangs = {'No Language': 'no-lang'};
  Set<String?> posterLangs = {};

  //current poster in modal
  String currentPoster = '';

  @override
  void initState() {
    super.initState();

    //get all posters
    posters = widget.posters;

    //add no-lang value to posters without language
    posters = posters.map((e) {
      e.iso6391 ??= 'no-lang';
      return e;
    }).toList();

    //get all languages from posters
    posterLangs = posters.map((e) => e.iso6391).toSet();

    //add poster languages to supported languages
    for (var lg in languages) {
      if (posterLangs.contains(lg.iso6391)) {
        supportedLangs.addAll({lg.englishName!: lg.iso6391});
      }
    }

    //filteres posters init value is all posters
    filteredPosters = posters;
  }

  List<Widget> selectLang(BuildContext context) {
    return [
      if (supportedLangs.length > 2)
        PopupMenuButton(
          color: Theme.of(context).colorScheme.onSecondary,
          icon: Icon(
            Icons.translate,
            color: ProjectColors(context).featured,
          ),
          itemBuilder: (context) {
            return supportedLangs.keys.map((String key) {
              return PopupMenuItem(
                value: supportedLangs[key].toString(),
                child: Text(key),
              );
            }).toList();
          },
          onSelected: (String value) {
            setState(() {
              selectedLang = supportedLangs.keys
                  .firstWhere((key) => supportedLangs[key] == value);

              filteredPosters =
                  posters.where((element) => element.iso6391 == value).toList();
            });
          },
        ),
      if (supportedLangs.length > 2)
        IconButton(
          onPressed: () {
            setState(() {
              selectedLang = 'All posters';
              filteredPosters = posters;
            });
          },
          icon: const Icon(Icons.refresh),
        ),
    ];
  }

  Widget posterGrid() {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.66666,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: filteredPosters.length,
      itemBuilder: (context, index) {
        final ImageItem imageItem = filteredPosters[index];

        String imageSrc = ImageHelper.getPoster(
          path: imageItem.filePath!,
          size: ImageSize.posterW185,
        );

        String fullImageSrc = ImageHelper.getPoster(
          path: imageItem.filePath!,
          size: ImageSize.posterW780,
        );

        String description =
            "${imageItem.iso6391} - ${imageItem.width} x ${imageItem.height}";

        return Imgy(
          src: imageSrc,
          enableFullScreen: true,
          fullSrc: fullImageSrc,
          placeholderColor: Colors.black,
          description: description,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // if no posters return empty view
    if (posters.isEmpty) {
      return const EmptyView(title: 'Posters');
    }

    return Scaffold(
      appBar: AppBar(
        title: PageTitle(
          title: '$selectedLang: ${filteredPosters.length}',
          subtitle: widget.title,
        ),
        actions: selectLang(context),
      ),
      body: posterGrid(),
    );
  }
}
