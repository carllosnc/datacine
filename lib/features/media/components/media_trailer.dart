import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vw/vw.dart';

class MediaTrailer extends StatelessWidget {
  final String? trailer;

  const MediaTrailer({super.key, required this.trailer});

  @override
  Widget build(BuildContext context) {
    if (trailer == null) return const SizedBox.shrink();

    return VWButton(
      onTap: () {
        launchUrl(Uri.parse(trailer!));
      },
      leftIcon: Icons.play_arrow,
      color: Colors.red.shade900,
      label: 'Watch trailer',
    );
  }
}
