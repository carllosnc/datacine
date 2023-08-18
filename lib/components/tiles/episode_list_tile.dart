import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';
import '../components.dart';

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

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: double.infinity,
              height: 170,
              child: ImageComponent(
                imagePath: episode.stillPath,
                imageType: ImageType.backdrop,
                imageSize: ImageSize.stillW300,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            (episode.airDate ?? '').formatDateTime(),
            style: TextStyle(
              fontSize: 12,
              color: ProjectColors(context).featured,
            ),
          ),
          Text(
            episode.name!,
            style: TextStyle(
              fontSize: 16,
              color: ProjectColors(context).text,
            ),
          ),
          if (checkOverview()) const SizedBox(height: 5),
          if (checkOverview())
            Text(
              episode.overview!,
              style: TextStyle(
                fontSize: 14,
                color: ProjectColors(context).label,
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
            color: ProjectColors(context).text,
          ),
        ),
      ),
    );
  }
}
