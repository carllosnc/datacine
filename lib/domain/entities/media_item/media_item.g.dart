// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaItem _$MediaItemFromJson(Map<String, dynamic> json) => MediaItem(
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as num?,
      character: json['character'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      originalName: json['original_name'] as String?,
      name: json['name'] as String?,
      overview: json['overview'] as String?,
      popularity: json['popularity'] as num?,
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] as String?,
      firstAirDate: json['first_air_date'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: json['vote_average'] as num?,
      voteCount: json['vote_count'] as num?,
      originCountry: (json['origin_country'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mediaType: json['media_type'] as String?,
      job: json['job'] as String?,
    );

Map<String, dynamic> _$MediaItemToJson(MediaItem instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'original_name': instance.originalName,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'first_air_date': instance.firstAirDate,
      'origin_country': instance.originCountry,
      'media_type': instance.mediaType,
      'adult': instance.adult,
      'character': instance.character,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'title': instance.title,
      'video': instance.video,
      'job': instance.job,
    };
