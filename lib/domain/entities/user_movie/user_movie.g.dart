// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMovie _$UserMovieFromJson(Map<String, dynamic> json) => UserMovie(
      id: json['id'] as String,
      cover: json['cover'] as String,
      title: json['title'] as String,
      date: json['date'] as String,
      backdrop: json['backdrop'] as String,
      userCategory:
          UserCategory.fromJson(json['userCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserMovieToJson(UserMovie instance) => <String, dynamic>{
      'id': instance.id,
      'cover': instance.cover,
      'title': instance.title,
      'date': instance.date,
      'backdrop': instance.backdrop,
      'userCategory': instance.userCategory.toJson(),
    };
