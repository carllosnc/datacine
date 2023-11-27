import 'package:flutter/material.dart';
import 'package:imgy/imgy.dart';
import 'package:vw/vw.dart';
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: VWColumn(
        gap: 5,
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
          const SizedBox(height: 5),
          VWRow(
            horizontalAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                (episode.airDate ?? '').formatDateTime(),
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.link,
                ),
              ),
              Text(
                'Ep ${episode.episodeNumber}',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.link,
                ),
              ),
            ],
          ),
          Text(
            episode.name!,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.title,
            ),
          ),
          if (checkOverview())
            Text(
              episode.overview!,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.label,
              ),
            ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
