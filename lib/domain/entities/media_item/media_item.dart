import 'package:json_annotation/json_annotation.dart';

part 'media_item.g.dart';

@JsonSerializable(explicitToJson: true)
class MediaItem {
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'genre_ids')
  final List<int>? genreIds;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @JsonKey(name: 'original_name')
  final String? originalName;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'vote_average')
  final num? voteAverage;

  @JsonKey(name: 'vote_count')
  final num? voteCount;

  @JsonKey(name: 'first_air_date')
  final String? firstAirDate;

  @JsonKey(name: 'origin_country')
  final List<String>? originCountry;

  final bool? adult;

  final num? id;

  final String? name;

  final String? overview;

  final num? popularity;

  final String? title;

  final bool? video;

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

  factory MediaItem.fromJson(Map<String, dynamic> json) =>
      _$MediaItemFromJson(json);

  Map<String, dynamic> toJson() => _$MediaItemToJson(this);
}
