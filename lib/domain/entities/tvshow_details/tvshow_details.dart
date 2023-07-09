import "/domain/domain.dart";
import 'package:json_annotation/json_annotation.dart';

part 'tvshow_details.g.dart';

@JsonSerializable(explicitToJson: true)
class TvShowDetails {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  @JsonKey(name: 'created_by')
  List<PersonItem>? createdBy;

  @JsonKey(name: 'episode_run_time')
  List<int>? episodeRunTime;

  @JsonKey(name: 'first_air_date')
  String? firstAirDate;

  @JsonKey(name: 'in_production')
  bool? inProduction;

  @JsonKey(name: 'last_air_date')
  String? lastAirDate;

  @JsonKey(name: 'number_of_episodes')
  int? numberOfEpisodes;

  @JsonKey(name: 'number_of_seasons')
  int? numberOfSeasons;

  @JsonKey(name: 'origin_country')
  List<String>? originCountry;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_name')
  String? originalName;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'production_companies')
  List<Company>? productionCompanies;

  @JsonKey(name: 'production_countries')
  List<ProductionContry>? productionCountries;

  @JsonKey(name: 'spoken_languages')
  List<Language>? spokenLanguages;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  @JsonKey(name: 'aggregate_credits')
  Map<String, List<PersonItem>>? aggregateCredits;

  @JsonKey(name: 'recommendations')
  MediaList? recommendations;

  @JsonKey(name: 'external_ids')
  Map<String, dynamic>? externalIds;

  List<String>? languages;

  String? name;

  String? overview;

  double? popularity;

  List<Season>? seasons;

  List<Genre>? genres;

  String? homepage;

  int? id;

  bool? adult;

  String? status;

  String? tagline;

  String? type;

  Map<String, List<Video>>? videos;

  Map<String, List<ImageItem>>? images;

  Map<String, List<PersonItem>>? credits;

  Map<String, List<Keyword>?>? keywords;

  MediaList? similar;

  TvShowDetails({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.name,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
    this.videos,
    this.images,
    this.aggregateCredits,
    this.credits,
    this.keywords,
    this.recommendations,
    this.similar,
  });

  factory TvShowDetails.fromJson(Map<String, dynamic> json) =>
      _$TvShowDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TvShowDetailsToJson(this);
}
