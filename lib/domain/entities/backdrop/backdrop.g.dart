// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'backdrop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Backdrop _$BackdropFromJson(Map<String, dynamic> json) => Backdrop(
      aspectRatio: json['aspect_ratio'] as num?,
      filePath: json['file_path'] as String?,
      height: json['height'] as num?,
      iso6391: json['iso_639_1'] as String?,
      voteAverage: json['vote_average'] as num?,
      voteCount: json['vote_count'] as num?,
      width: json['width'] as num?,
    );

Map<String, dynamic> _$BackdropToJson(Backdrop instance) => <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'file_path': instance.filePath,
      'iso_639_1': instance.iso6391,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
      'height': instance.height,
    };
