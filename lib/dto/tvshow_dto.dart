import '/imports/app.dart';

class TvShowDto {
  final TvShowDetails tvshow;

  TvShowDto(this.tvshow);

  int get id => tvshow.id!;

  String get name => tvshow.name ?? 'No Name';

  String get originalName => tvshow.originalName!;

  String get lastAirDate => tvshow.lastAirDate!.formatDateTime();

  String get firstAirDate => tvshow.firstAirDate!.formatDateTime();

  String get tagline => tvshow.tagline ?? 'No tagline';

  String get date {
    if (hasFirstAirDate && hasLastAirDate) {
      return '$firstAirDate - $lastAirDate';
    } else if (hasFirstAirDate) {
      return firstAirDate;
    } else if (hasLastAirDate) {
      return lastAirDate;
    } else {
      return 'Unknown date';
    }
  }

  List<PersonItem> get cast => tvshow.credits!['cast']!;

  List<PersonItem> get crew => tvshow.credits!['crew']!;

  List<Keyword> get keywords => tvshow.keywords!['results']!;

  String get overview => tvshow.overview!;

  String? get poster => tvshow.posterPath;

  Map<String, List<PersonItem>>? get credits => tvshow.credits;

  List<Video>? get videos => tvshow.videos!['results'];

  String get status => tvshow.status ?? 'Unknown status';

  num get voteAverage => tvshow.voteAverage ?? 0;

  num get voteCount => tvshow.voteCount ?? 0;

  String get genres {
    var genres = tvshow.genres!.map((genre) => genre.name).toList();
    return genres.join(', ');
  }

  List<PersonItem> get createdBy => tvshow.createdBy!;

  List<Company> get productionCompanies => tvshow.productionCompanies!;

  String get spokenLanguages {
    var spokenLanguages = tvshow.spokenLanguages!.map((language) {
      return language.name;
    }).toList();
    return spokenLanguages.join(', ');
  }

  String get productionCountries {
    var productionCountries = tvshow.productionCountries!.map((country) {
      return country.name;
    }).toList();
    return productionCountries.join(', ');
  }

  String get numberOfSeasons => tvshow.numberOfSeasons.toString();

  String get numberOfEpisodes => tvshow.numberOfEpisodes.toString();

  String get genresAsString {
    var genres = tvshow.genres!.map((genre) => genre.name).toList();
    return genres.join(', ');
  }

  List<Keyword> get keywordsList => tvshow.keywords!['results']!;

  String? get trailer {
    if (hasVideos == false) {
      return null;
    }

    var videos = tvshow.videos!['results']!;

    var trailer = videos.firstWhere(
      (video) => video.type == 'Trailer' && video.official == true,
      orElse: () => videos.first,
    );

    return 'https://www.youtube.com/watch?v=${trailer.key}';
  }

  List<Season> get seasons => tvshow.seasons!;

  List<ImageItem> get posters => tvshow.images!['posters'] ?? [];

  //checks

  bool get hasTagline => tvshow.tagline != null && tvshow.tagline!.isNotEmpty;
  bool get hasGenres => tvshow.genres != null && tvshow.genres!.isNotEmpty;
  bool get hasNumberOfSeasons => tvshow.numberOfSeasons != null;
  bool get hasNumberOfEpisodes => tvshow.numberOfEpisodes != null;
  bool get hasProductionCountries => tvshow.productionCountries != null && tvshow.productionCountries!.isNotEmpty;
  bool get hasSpokenLanguages => tvshow.spokenLanguages != null && tvshow.spokenLanguages!.isNotEmpty;
  bool get hasOriginalName => tvshow.originalName != null;
  bool get hasProductionCompanies => tvshow.productionCompanies!.isNotEmpty;
  bool get hasLastAirDate => tvshow.lastAirDate != null;
  bool get hasFirstAirDate => tvshow.firstAirDate != null;
  bool get hasStatus => tvshow.status != null;
  bool get hasName => tvshow.name != null;
  bool get hasCast => tvshow.credits?['cast'] != null && tvshow.credits!['cast']!.isNotEmpty && tvshow.credits!['cast']!.length >= 3;
  bool get hasCrew => tvshow.credits?['crew'] != null && tvshow.credits!['crew']!.isNotEmpty && tvshow.credits!['crew']!.length >= 3;
  bool get hasKeywords => tvshow.keywords!['results'] != null && tvshow.keywords!['results']!.isNotEmpty;
  bool get hasPosters => tvshow.images!['posters']!.isNotEmpty;
  bool get hasBackdrop => tvshow.images!['backdrops']!.isNotEmpty;
  bool get hasOverview => tvshow.overview != null && tvshow.overview!.isNotEmpty;
  bool get hasRecommendations => tvshow.recommendations!.results!.isNotEmpty;
  bool get hasSimilar => tvshow.similar!.results!.isNotEmpty;
  bool get hasSeasons => tvshow.seasons!.isNotEmpty;
  bool get hasCreatedBy => tvshow.createdBy!.isNotEmpty;
  bool get hasVoteAverage => tvshow.voteAverage != null;
  bool get hasVoteCount => tvshow.voteCount != null;
  bool get hasLogo => tvshow.images!['logos']!.isNotEmpty;
  bool get hasCredits => tvshow.credits!['cast']!.isNotEmpty && tvshow.credits!['crew']!.isNotEmpty;
  bool get hasVideos => tvshow.videos!['results']!.isNotEmpty;
  bool get hasGridMenu {
    return hasCredits || hasPosters || hasRecommendations || hasSimilar;
  }
}
