import 'package:flutter/material.dart';
import '/domain/domain.dart';
import '/core/core.dart';

class EpisodeListTile extends StatelessWidget {
  final Episode episode;

  const EpisodeListTile({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        episode.name!,
        style: TextStyle(
          fontSize: 14,
          color: ProjectColors(context).text,
        ),
      ),
      subtitle: Text(
        (episode.airDate ?? '').formatDateTime(),
        style: TextStyle(
          fontSize: 14,
          color: ProjectColors(context).featured,
        ),
      ),
      leading: Text(
        episode.episodeNumber.toString(),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: ProjectColors(context).label,
        ),
      ),
    );
  }
}
