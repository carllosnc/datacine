// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonList _$PersonListFromJson(Map<String, dynamic> json) => PersonList(
      page: json['page'] as num?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PersonItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as num?,
      totalResults: json['total_results'] as num?,
    );

Map<String, dynamic> _$PersonListToJson(PersonList instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'page': instance.page,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
