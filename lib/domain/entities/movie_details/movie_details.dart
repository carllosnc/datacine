import 'package:json_annotation/json_annotation.dart';
import '/imports.dart';

part 'movie_details.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetails {
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  final BelongsToCollection? belongsToCollection;

  @JsonKey(name: 'imdb_id')
  final String? imdbId;

  @JsonKey(name: 'original_language')
  final String? originalLanguage;

  @JsonKey(name: 'original_title')
  final String? originalTitle;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'production_companies')
  final List<Company>? productionCompanies;

  @JsonKey(name: 'production_countries')
  final List<ProductionContry>? productionCountries;

  @JsonKey(name: 'release_date')
  final String? releaseDate;

  @JsonKey(name: 'spoken_languages')
  final List<Language>? spokenLanguages;

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
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.externalIds,
    this.images,
    this.keywords,
    this.recommendations,
    this.similar,
    this.videos,
    this.credits,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}
