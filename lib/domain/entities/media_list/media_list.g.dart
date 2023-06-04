// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaList _$MediaListFromJson(Map<String, dynamic> json) => MediaList(
      page: json['page'] as num?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as num?,
      totalResults: json['total_results'] as num?,
    );

Map<String, dynamic> _$MediaListToJson(MediaList instance) => <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
