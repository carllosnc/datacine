import '/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetails {
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  final Map<String, dynamic>? belongsToCollection;

  @JsonKey(name: 'imdb_id')
  final String? imdbId;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'production_companies')
  final List<ProductionCompany>? productionCompanies;

  @JsonKey(name: 'production_countries')
  final List<ProductionContry>? productionCountries;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage>? spokenLanguages;

  @JsonKey(name: 'vote_average')
  final num? voteAverage;

  @JsonKey(name: 'vote_count')
  final num? voteCount;

  @JsonKey(name: 'external_ids')
  final Map<String, dynamic>? externalIds;

  final Map<String, List<PersonItem>>? credits;

  final bool? adult;

  final num? budget;

  final List<Genre>? genres;

  final String? homepage;

  final num? id;

  final String? overview;

  final num? popularity;

  final num? revenue;

  final num? runtime;

  final String? status;

  final String? tagline;

  final String? title;

  final bool? video;

  final Map<String, List<ImageItem>?>? images;

  final Map<String, List<Keyword>?>? keywords;

  final MediaList? recommendations;

  final MediaList? similar;

  final Map<String, List<Video>?>? videos;

  MovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.externalIds,
    required this.images,
    required this.keywords,
    required this.recommendations,
    required this.similar,
    required this.videos,
    required this.credits,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
