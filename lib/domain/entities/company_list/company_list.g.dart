// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyList _$CompanyListFromJson(Map<String, dynamic> json) => CompanyList(
      page: json['page'] as num?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as num?,
      totalResults: json['total_results'] as num?,
    );

Map<String, dynamic> _$CompanyListToJson(CompanyList instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results?.map((e) => e.toJson()).toList(),
    };
