import 'package:datacine/core/core.dart';

import '/domain/domain.dart';

class MovieDto {
  final MovieDetails movie;

  MovieDto(this.movie);

  String get title => movie.title!;

  String get releaseDate =>
      movie.releaseDate?.formatDateTime() ?? 'Unknown date';

  String? get poster => movie.posterPath;

  List<PersonItem> get cast => movie.credits!['cast']!;

  Map<String, List<PersonItem>>? get credits => movie.credits;

  List<Video>? get videos => movie.videos!['results'];

  num get voteAverage => movie.voteAverage!;

  num get voteCount => movie.voteCount!;

  String get status => movie.status!;

  //list of genres as string
  String get genres {
    var genres = movie.genres!.map((genre) => genre.name).toList();
    return genres.join(', ');
  }

  //checks

  bool get hasTitle => movie.title != null;
  bool get hasReleaseDate => movie.releaseDate != null;
  bool get hasKeywords =>
      movie.keywords!['keywords'] != null &&
      movie.keywords!['keywords']!.isNotEmpty;
  bool get hasCollection => movie.belongsToCollection != null;
  bool get hasCast =>
      movie.credits?['cast'] != null &&
      movie.credits!['cast']!.isNotEmpty &&
      movie.credits!['cast']!.length >= 3;
  bool get hasOverview => movie.overview != null && movie.overview!.isNotEmpty;
  bool get hasTagline => movie.tagline != null && movie.tagline!.isNotEmpty;
  bool get hasPosters => movie.images!['posters']!.isNotEmpty;
  bool get hasBackdrop => movie.images!['backdrops']!.isNotEmpty;
  bool get hasLogo => movie.images!['logos']!.isNotEmpty;
  bool get hasCredits =>
      movie.credits!['cast']!.isNotEmpty && movie.credits!['crew']!.isNotEmpty;
  bool get hasVideos => movie.videos!['results']!.isNotEmpty;
  bool get hasRecommendations => movie.recommendations!.results!.isNotEmpty;
  bool get hasSimilar => movie.similar!.results!.isNotEmpty;
  bool get hasVoteAverage => movie.voteAverage != null;
  bool get hasStatus => movie.status != null;
  bool get hasVoteCount => movie.voteCount != null;
  bool get hasGenres => movie.genres!.isNotEmpty;
}
