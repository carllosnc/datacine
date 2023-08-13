import 'package:datacine/core/core.dart';

import '/domain/domain.dart';

class TvShowDto {
  final TvShowDetails tvshow;

  TvShowDto(this.tvshow);

  String get name => tvshow.name!;

  String get status => tvshow.status!;

  String get lastAirDate => tvshow.lastAirDate!.formatDateTime();

  String get firstAirDate => tvshow.firstAirDate!.formatDateTime();

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

  num get voteAverage => tvshow.voteAverage!;

  num get voteCount => tvshow.voteCount!;

  String get genres {
    var genres = tvshow.genres!.map((genre) => genre.name).toList();
    return genres.join(', ');
  }

  List<PersonItem> get createdBy => tvshow.createdBy!;

  //checks

  bool get hasLastAirDate => tvshow.lastAirDate != null;
  bool get hasFirstAirDate => tvshow.firstAirDate != null;
  bool get hasStatus => tvshow.status != null;
  bool get hasName => tvshow.name != null;
  bool get hasCast =>
      tvshow.credits?['cast'] != null &&
      tvshow.credits!['cast']!.isNotEmpty &&
      tvshow.credits!['cast']!.length >= 3;
  bool get hasCrew =>
      tvshow.credits?['crew'] != null &&
      tvshow.credits!['crew']!.isNotEmpty &&
      tvshow.credits!['crew']!.length >= 3;
  bool get hasKeywords =>
      tvshow.keywords!['results'] != null &&
      tvshow.keywords!['results']!.isNotEmpty;
  bool get hasPosters => tvshow.images!['posters']!.isNotEmpty;
  bool get hasBackdrop => tvshow.images!['backdrops']!.isNotEmpty;
  bool get hasOverview =>
      tvshow.overview != null && tvshow.overview!.isNotEmpty;
  bool get hasRecommendations => tvshow.recommendations!.results!.isNotEmpty;
  bool get hasSimilar => tvshow.similar!.results!.isNotEmpty;
  bool get hasSeasons => tvshow.seasons!.isNotEmpty;
  bool get hasCreatedBy => tvshow.createdBy!.isNotEmpty;
  bool get hasVoteAverage => tvshow.voteAverage != null;
  bool get hasVoteCount => tvshow.voteCount != null;
  bool get hasLogo => tvshow.images!['logos']!.isNotEmpty;
  bool get hasCredits =>
      tvshow.credits!['cast']!.isNotEmpty &&
      tvshow.credits!['crew']!.isNotEmpty;
  bool get hasVideos => tvshow.videos!['results']!.isNotEmpty;
  bool get hasGenres => tvshow.genres!.isNotEmpty;
}
