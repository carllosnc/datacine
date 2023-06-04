import '/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable(explicitToJson: true)
class MovieDetails {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'belongs_to_collection')
  Map<String, dynamic>? belongsToCollection;

  @JsonKey(name: 'imdb_id')
  String? imdbId;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? productionCompanies;

  @JsonKey(name: 'production_countries')
  List<ProductionContry>? productionCountries;

  @JsonKey(name: 'release_date')
  String? releaseDate;

  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? spokenLanguages;

  @JsonKey(name: 'vote_average')
  num? voteAverage;

  @JsonKey(name: 'vote_count')
  num? voteCount;

  @JsonKey(name: 'external_ids')
  Map<String, dynamic>? externalIds;

  Map<String, List<PeopleItem>>? credits;

  bool? adult;

  num? budget;

  List<Genre>? genres;

  String? homepage;

  num? id;

  String? overview;

  num? popularity;

  num? revenue;

  num? runtime;

  String? status;

  String? tagline;

  String? title;

  bool? video;

  List<Backdrop>? backdrops;

  List<Poster>? posters;

  List<Logo>? logos;

  Map<String, List<Keyword>?>? keywords;

  MediaList? recommendations;

  MediaList? similar;

  Map<String, List<Video>?>? videos;

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
    required this.backdrops,
    required this.posters,
    required this.logos,
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
