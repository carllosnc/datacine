import 'package:ds1/ds1.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '/domain/domain.dart';

class MediaTrailer extends StatelessWidget {
  final List<Video>? videos;

  const MediaTrailer({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    if (videos == null || videos!.isEmpty) return const SizedBox.shrink();

    var trailer = videos!.firstWhere(
      (Video video) => video.type == 'Trailer' && video.official == true,
      orElse: () => videos!.first,
    );

    var youtubeLink = 'https://www.youtube.com/watch?v=${trailer.key}';

    return DS1Button(
      size: "mini",
      label: "Watch trailer",
      icon: Icons.play_arrow,
      onTap: () {
        launchUrl(Uri.parse(youtubeLink));
      },
    );
  }
}
