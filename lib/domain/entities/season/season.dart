import 'package:json_annotation/json_annotation.dart';

part 'season.g.dart';

@JsonSerializable(explicitToJson: true)
class Season {
  @JsonKey(name: 'air_date')
  final String? airDate;

  @JsonKey(name: 'episode_count')
  final int? episodeCount;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'season_number')
  final int? seasonNumber;

  final int? id;

  final String? name;

  final String? overview;

  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
  });

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}
