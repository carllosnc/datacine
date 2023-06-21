// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Season _$SeasonFromJson(Map<String, dynamic> json) => Season(
      airDate: json['air_date'] as String?,
      episodeCount: json['episode_count'] as int?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      posterPath: json['poster_path'] as String?,
      seasonNumber: json['season_number'] as int?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeasonToJson(Season instance) => <String, dynamic>{
      'air_date': instance.airDate,
      'episode_count': instance.episodeCount,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'episodes': instance.episodes?.map((e) => e.toJson()).toList(),
    };
