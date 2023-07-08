import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/domain/domain.dart';
import 'package:url_launcher/url_launcher.dart';

class PersonExternalLinks extends StatelessWidget {
  final PersonDetails person;

  const PersonExternalLinks({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    if (person.externalIds?['imdb_id'] == null &&
        person.externalIds?['instagram_id'] == null &&
        person.externalIds?['facebook_id'] == null &&
        person.externalIds?['twitter_id'] == null &&
        person.externalIds?['tiktok_id'] == null &&
        person.externalIds?['wikidata_id'] == null) {
      return const SizedBox.shrink();
    }

    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          if (person.externalIds?['imdb_id'] != null)
            PopupMenuItem(
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://www.imdb.com/name/${person.externalIds?['imdb_id']}',
                  ),
                );
              },
              child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.imdb,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "IMDb",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          if (person.externalIds?['instagram_id'] != null)
            PopupMenuItem(
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://www.instagram.com/${person.externalIds?['instagram_id']}',
                  ),
                );
              },
              child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Instagram",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          if (person.externalIds?['facebook_id'] != null)
            PopupMenuItem(
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://www.facebook.com/${person.externalIds?['facebook_id']}',
                  ),
                );
              },
              child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Facebook",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          if (person.externalIds?['twitter_id'] != null)
            PopupMenuItem(
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://twitter.com/${person.externalIds?['twitter_id']}',
                  ),
                );
              },
              child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.twitter,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Twitter",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          if (person.externalIds?['tiktok_id'] != null)
            PopupMenuItem(
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://www.tiktok.com/@${person.externalIds?['tiktok_id']}',
                  ),
                );
              },
              child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.tiktok,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "TikTok",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          if (person.externalIds?['wikidata_id'] != null)
            PopupMenuItem(
              onTap: () {
                launchUrl(
                  Uri.parse(
                    'https://www.wikidata.org/wiki/${person.externalIds?['wikidata_id']}',
                  ),
                );
              },
              child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.wikipediaW,
                    size: 15,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Wikidata",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
        ];
      },
    );
  }
}
