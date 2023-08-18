import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '/imports/app.dart';

class PersonExternalLinks extends StatelessWidget {
  final PersonDto person;

  const PersonExternalLinks({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    if (person.hasExternalLinks) {
      return const SizedBox.shrink();
    }

    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          if (person.hasImdbId)
            linkItem(
              url: person.imdbUrl,
              icon: FontAwesomeIcons.imdb,
              label: "IMDb",
            ),
          if (person.hasInstagramId)
            linkItem(
              url: person.instagramUrl,
              icon: FontAwesomeIcons.instagram,
              label: "Instagram",
            ),
          if (person.hasFacebookId)
            linkItem(
              url: person.facebookUrl,
              icon: FontAwesomeIcons.facebook,
              label: "Facebook",
            ),
          if (person.hasTwitterId)
            linkItem(
              url: person.twitterUrl,
              icon: FontAwesomeIcons.twitter,
              label: "Twitter",
            ),
          if (person.hasTiktokId)
            linkItem(
              url: person.tiktokUrl,
              icon: FontAwesomeIcons.tiktok,
              label: "TikTok",
            ),
          if (person.hasWikidataId)
            linkItem(
              url: person.wikidataUrl,
              icon: FontAwesomeIcons.wikipediaW,
              label: "Wikipedia",
            )
        ];
      },
    );
  }

  PopupMenuItem<dynamic> linkItem({
    required String url,
    required IconData icon,
    required String label,
  }) {
    return PopupMenuItem(
      onTap: () {
        launchUrl(
          Uri.parse(url),
        );
      },
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          FaIcon(
            icon,
            size: 15,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
