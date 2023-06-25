// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      id: json['id'] as int,
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };
