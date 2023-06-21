// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonItem _$PersonItemFromJson(Map<String, dynamic> json) => PersonItem(
      adult: json['adult'] as bool?,
      id: json['id'] as num?,
      originalName: json['original_name'] as String?,
      popularity: json['popularity'] as num?,
      gender: json['gender'] as num?,
      knownForDepartment: json['known_for_department'] as String?,
      profilePath: json['profile_path'] as String?,
      knownFor: (json['known_for'] as List<dynamic>?)
          ?.map((e) => MediaItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      character: json['character'] as String?,
      job: json['job'] as String?,
      department: json['department'] as String?,
      name: json['name'] as String?,
      mediaType: json['media_type'] as String?,
    );

Map<String, dynamic> _$PersonItemToJson(PersonItem instance) =>
    <String, dynamic>{
      'original_name': instance.originalName,
      'known_for_department': instance.knownForDepartment,
      'profile_path': instance.profilePath,
      'known_for': instance.knownFor?.map((e) => e.toJson()).toList(),
      'media_type': instance.mediaType,
      'name': instance.name,
      'adult': instance.adult,
      'id': instance.id,
      'popularity': instance.popularity,
      'gender': instance.gender,
      'character': instance.character,
      'job': instance.job,
      'department': instance.department,
    };
