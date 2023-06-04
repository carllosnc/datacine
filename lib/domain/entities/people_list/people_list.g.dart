// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeopleList _$PeopleListFromJson(Map<String, dynamic> json) => PeopleList(
      page: json['page'] as num?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PeopleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as num?,
      totalResults: json['total_results'] as num?,
    );

Map<String, dynamic> _$PeopleListToJson(PeopleList instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'page': instance.page,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
