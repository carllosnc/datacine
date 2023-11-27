import 'package:flutter/material.dart';
import 'package:imgy/imgy.dart';
import '/imports/app.dart';

class EpisodeListTile extends StatelessWidget {
  final Episode episode;

  const EpisodeListTile({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    bool checkOverview() {
      if (episode.overview == null || episode.overview == '') {
        return false;
      }
      return true;
    }

    var image = ImageHelper.getBackdrop(
      path: episode.stillPath,
      size: ImageSize.backdropW780,
    );

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                episode.stillPath == null ? AppColors.imageFilter : Colors.transparent,
                BlendMode.color,
              ),
              child: Imgy(
                height: 170,
                width: double.infinity,
                src: image,
                borderRadius: BorderRadius.circular(10),
                fullSrc: image,
                placeholderColor: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            (episode.airDate ?? '').formatDateTime(),
            style: TextStyle(
              fontSize: 12,
              color: AppColors.link,
            ),
          ),
          Text(
            episode.name!,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.label,
            ),
          ),
          if (checkOverview()) const SizedBox(height: 5),
          if (checkOverview())
            Text(
              episode.overview!,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.label,
              ),
            ),
          const SizedBox(height: 25)
        ],
      ),
      leading: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(3),
        ),
        padding: const EdgeInsets.all(5),
        child: Text(
          episode.episodeNumber!.toString().padLeft(2, '0'),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.label,
          ),
        ),
      ),
    );
  }
}
