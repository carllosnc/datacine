import '/core/core.dart';
import '/domain/domain.dart';

class MovieDto {
  final MovieDetails movie;

  MovieDto(this.movie);

  String get title => movie.title ?? 'No Title';

  String? get originalTitle => movie.originalTitle;

  String get tagline => movie.tagline!;

  String get overview => movie.overview!;

  String get releaseDate =>
      movie.releaseDate?.formatDateTime() ?? 'Unknown date';

  String? get poster => movie.posterPath;

  List<PersonItem> get cast => movie.credits!['cast']!;

  Map<String, List<PersonItem>>? get credits => movie.credits;

  List<Video>? get videos => movie.videos!['results'];

  num get voteAverage => movie.voteAverage ?? 0;

  num get voteCount => movie.voteCount ?? 0;

  String get status => movie.status ?? 'Unknown status';

  String get genres {
    var genres = movie.genres!.map((genre) => genre.name).toList();
    return genres.join(', ');
  }

  List<Company> get productionCompanies => movie.productionCompanies!;

  String get runTime {
    var runTime = movie.runtime ?? 0;
    var hours = runTime ~/ 60;
    var minutes = runTime % 60;
    return '$hours h $minutes min';
  }

  String get productionCountries {
    var countries = movie.productionCountries!.map((country) => country.name);
    return countries.join(', ');
  }

  String get spokenLanguages {
    var languages = movie.spokenLanguages!.map((language) => language.name);
    return languages.join(', ');
  }

  String get budget {
    var budget = movie.budget ?? 0;
    return '$budget'.formatMoney();
  }

  String get revenue {
    var revenue = movie.revenue ?? 0;
    return '$revenue'.formatMoney();
  }

  List<Keyword> get keywords => movie.keywords!['keywords']!;

  String? get trailer {
    if (hasVideos == false) {
      return null;
    }

    var videos = movie.videos!['results']!;
    var trailer = videos.firstWhere(
      (video) => video.type == 'Trailer' && video.official == true,
      orElse: () => videos.first,
    );

    return 'https://www.youtube.com/watch?v=${trailer.key}';
  }

  List<ImageItem> get posters => movie.images!['posters'] ?? [];

  //checks

  bool get hasBudget => movie.budget != null && movie.budget! > 0;
  bool get hasRevenue => movie.revenue != null && movie.revenue! > 0;
  bool get hasSpokenLanguages =>
      movie.spokenLanguages != null && movie.spokenLanguages!.isNotEmpty;
  bool get hasProductionCountries =>
      movie.productionCountries != null &&
      movie.productionCountries!.isNotEmpty;
  bool get hasRuntime => movie.runtime != null;
  bool get hasTitle => movie.title != null;
  bool get hasOriginalTitle => movie.originalTitle != null;
  bool get hasPosterPath => movie.posterPath != null;
  bool get hasPoster => movie.posterPath != null;
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
