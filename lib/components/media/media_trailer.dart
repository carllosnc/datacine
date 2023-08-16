import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MediaTrailer extends StatelessWidget {
  final String? trailer;

  const MediaTrailer({super.key, required this.trailer});

  @override
  Widget build(BuildContext context) {
    if (trailer == null) return const SizedBox.shrink();

    return FilledButton(
      onPressed: () {
        launchUrl(Uri.parse(trailer!));
      },
      child: const Row(
        children: [
          Icon(Icons.play_arrow),
          SizedBox(width: 8),
          Text('Watch trailer'),
        ],
      ),
    );
  }
}
