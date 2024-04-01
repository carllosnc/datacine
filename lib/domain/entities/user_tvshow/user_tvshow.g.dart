// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tvshow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTvshow _$UserTvshowFromJson(Map<String, dynamic> json) => UserTvshow(
      id: json['id'] as String,
      cover: json['cover'] as String,
      name: json['name'] as String,
      date: json['date'] as String,
      backdrop: json['backdrop'] as String,
      userCategory:
          UserCategory.fromJson(json['userCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserTvshowToJson(UserTvshow instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'name': instance.name,
      'date': instance.date,
      'backdrop': instance.backdrop,
      'userCategory': instance.userCategory.toJson(),
    };
