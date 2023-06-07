import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable(explicitToJson: true)
class Episode {
  @JsonKey(name: 'vote_average')
  final double? voteAverage;

  @JsonKey(name: 'vote_count')
  final int? voteCount;

  @JsonKey(name: 'air_date')
  final String? airDate;

  @JsonKey(name: 'episode_number')
  final int? episodeNumber;

  @JsonKey(name: 'production_code')
  final String? productionCode;

  @JsonKey(name: 'season_number')
  final int? seasonNumber;

  @JsonKey(name: 'show_id')
  final int? showId;

  @JsonKey(name: 'still_path')
  final String? stillPath;

  final int? id;

  final String? name;

  final String? overview;

  final int? runtime;

  Episode({
    this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
