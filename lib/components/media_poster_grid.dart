import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:giganoid_app/core/core.dart';
import '/domain/domain.dart';
import '/components/components.dart';

class MediaPosterGrid extends StatefulWidget {
  final Map<String, List<ImageItem>?>? images;

  const MediaPosterGrid({
    super.key,
    required this.images,
  });

  @override
  State<MediaPosterGrid> createState() => _MediaPosterGridState();
}

class _MediaPosterGridState extends State<MediaPosterGrid> {
  List<ImageItem> filteredPosters = [];
  List<ImageItem> posters = [];
  String selectedLang = 'en';
  Map<String, dynamic> supportedLangs = {'No Language': 'no-lang'};
  Set<String?> posterLangs = {};
  bool modal = false;
  double overLayerOpacity = 0.0;
  Duration overLayerAnimationTime = const Duration(milliseconds: 200);
  String currentPoster = '';
  double posterOpacity = 0.0;
  double posterMargin = 200;
  double posterScale = 0.8;
  Duration posterAnimationTime = const Duration(milliseconds: 200);

  @override
  void initState() {
    super.initState();
    posters = widget.images!['posters']!;

    //add no-lang to posters without language
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

    //set default language to english if exists or first language
    if (posterLangs.isNotEmpty) {
      selectedLang = posterLangs.contains('en') ? 'en' : posterLangs.first!;
    }

    //filter posters by selected language
    filteredPosters =
        posters.where((element) => element.iso6391 == selectedLang).toList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  openModal(String path) {
    setState(() {
      modal = true;
      currentPoster = path;
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {
        overLayerOpacity = 0.5;
        posterOpacity = 1;
        posterScale = 1;
        posterMargin = 0;
      });
    });
  }

  closeModal() {
    setState(() {
      overLayerOpacity = 0;
      posterOpacity = 0;
      posterScale = 0.8;
      posterMargin = 200;
    });

    Future.delayed(overLayerAnimationTime, () {
      setState(() {
        modal = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double posterWidth = MediaQuery.of(context).size.width;
    double posterHeight = posterWidth * 1.5;

    if (posters.isEmpty) {
      return const Empty();
    }

    return Stack(
      children: [
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.66666,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemCount: posters.length,
          itemBuilder: (context, index) {
            final ImageItem imageItem = posters[index];

            return GestureDetector(
              onTap: () {
                openModal(imageItem.filePath!);
              },
              child: SizedBox(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ImageComponent(
                              imageSize: ImageSize.posterW185,
                              imagePath: imageItem.filePath,
                              imageType: ImageType.poster,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        if (modal == true)
          Positioned(
            child: GestureDetector(
              onTap: () {
                closeModal();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: AnimatedContainer(
                  duration: overLayerAnimationTime,
                  color: Colors.black.withOpacity(overLayerOpacity),
                ),
              ),
            ),
          ),
        if (modal == true)
          Positioned.fill(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  closeModal();
                },
                child: AnimatedScale(
                  duration: posterAnimationTime,
                  curve: Curves.ease,
                  scale: posterScale,
                  child: AnimatedOpacity(
                    duration: posterAnimationTime,
                    opacity: posterOpacity,
                    child: Container(
                      height: posterHeight,
                      width: posterWidth,
                      decoration: BoxDecoration(
                        color: ProjectColors(context)
                            .text
                            .withOpacity(posterOpacity),
                        border: Border.all(
                          color: ProjectColors(context).text.withOpacity(0.2),
                          width: 3,
                        ),
                      ),
                      child: ImageComponent(
                        imageSize: ImageSize.posterOriginal,
                        imagePath: currentPoster,
                        imageType: ImageType.poster,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
