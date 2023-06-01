class MediaItem {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final num? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? originalName;
  final String? name;
  final String? overview;
  final num? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num? voteAverage;
  final num? voteCount;
  final String? firstAirDate;
  final List<String?>? originCountry;

  MediaItem({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.originalName,
    required this.name,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.firstAirDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.originCountry,
  });

  MediaItem.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = json['backdrop_path'],
        genreIds = json['genre_ids']?.cast<int>(),
        id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        originalName = json['original_name'],
        name = json['name'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        firstAirDate = json['first_air_date'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'],
        originCountry = json['origin_country']?.cast<String>();

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'original_name': originalName,
      'name': name,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'first_air_date': firstAirDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'origin_country': originCountry,
    };
  }
}
