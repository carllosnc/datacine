import '/imports/app.dart';

class PersonDto {
  final PersonDetails person;

  PersonDto({
    required this.person,
  });

  num get id => person.id!;

  String get name => person.name!;

  String? get imdbId => person.externalIds?['imdb_id'];
  String get imdbUrl => 'https://www.imdb.com/name/$imdbId';

  String? get instagramId => person.externalIds?['instagram_id'];
  String get instagramUrl => 'https://www.instagram.com/$instagramId';

  String? get facebookId => person.externalIds?['facebook_id'];
  String get facebookUrl => 'https://www.facebook.com/$facebookId';

  String? get twitterId => person.externalIds?['twitter_id'];
  String get twitterUrl => 'https://twitter.com/$twitterId';

  String? get tiktokId => person.externalIds?['tiktok_id'];
  String get tiktokUrl => 'https://www.tiktok.com/@$tiktokId';

  String? get wikidataId => person.externalIds?['wikidata_id'];
  String get wikidataUrl => 'https://www.wikidata.org/wiki/$wikidataId';

  String? get profilePath => person.profilePath;

  String get knownForDepartment => person.knownForDepartment ?? '—';

  List<MediaItem> get movieCast => person.movieCredits!['cast']!;
  List<MediaItem> get tvCast => person.tvCredits!['cast']!;

  List<MediaItem> get movieCrew => person.movieCredits!['crew']!;
  List<MediaItem> get tvCrew => person.tvCredits!['crew']!;

  List<MediaItem> get knownForCredits {
    List<MediaItem> movies = person.combinedCredits?['cast'] ?? [];
    List<MediaItem> series = person.combinedCredits?['crew'] ?? [];

    List<MediaItem> allCredits = [...movies, ...series];

    if (allCredits.isNotEmpty) {
      allCredits.sort((a, b) {
        var aVote = a.voteCount ?? 0;
        var bVote = b.voteCount ?? 0;

        return bVote.compareTo(aVote);
      });
    }

    allCredits = allCredits.unique((p1) => p1.id);

    allCredits = allCredits.take(20).toList();

    return allCredits;
  }

  List<ImageItem>? get profileImages {
    List<ImageItem>? images = person.images?['profiles'];

    return images;
  }

  String get birthday => person.birthday!.formatDateTime();
  String get deathday => person.deathday!.formatDateTime();
  String get placeOfBirth => person.placeOfBirth!;
  String get biography => person.biography!;

  //checks

  bool get hasImdbId => person.externalIds?['imdb_id'] != null;
  bool get hasInstagramId => person.externalIds?['instagram_id'] != null;
  bool get hasFacebookId => person.externalIds?['facebook_id'] != null;
  bool get hasTwitterId => person.externalIds?['twitter_id'] != null;
  bool get hasTiktokId => person.externalIds?['tiktok_id'] != null;
  bool get hasWikidataId => person.externalIds?['wikidata_id'] != null;

  bool get hasCredits {
    return [
          ...person.combinedCredits?['cast'] ?? [],
          ...person.combinedCredits?['crew'] ?? [],
        ].length >
        3;
  }

  bool get hasProfileImages {
    return (person.images?['profiles']?.isNotEmpty ?? false) &&
        (person.images!['profiles']!.length > 3);
  }

  bool get hasExternalLinks {
    return [
      person.externalIds?['imdb_id'],
      person.externalIds?['instagram_id'],
      person.externalIds?['facebook_id'],
      person.externalIds?['twitter_id'],
      person.externalIds?['tiktok_id'],
      person.externalIds?['wikidata_id'],
    ].any((element) => element != null);
  }

  bool get hasProfilePath => person.profilePath != null;
  bool get hasMovieCast => person.movieCredits!['cast']!.isNotEmpty;
  bool get hasMovieCrew => person.movieCredits!['crew']!.isNotEmpty;
  bool get hasTvCast => person.tvCredits!['cast']!.isNotEmpty;
  bool get hasTvCrew => person.tvCredits!['crew']!.isNotEmpty;
  bool get hasBirthday => person.birthday != null;
  bool get hasDeathday => person.deathday != null;
  bool get hasPlaceOfBirth => person.placeOfBirth != null;
  bool get hasBiography =>
      person.biography != null && person.biography!.isNotEmpty;

  bool get hasInfo {
    return [
      hasBirthday,
      hasDeathday,
      hasPlaceOfBirth,
      hasBiography,
    ].any((element) => element == true);
  }
}
