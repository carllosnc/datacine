// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionContry _$ProductionContryFromJson(Map<String, dynamic> json) =>
    ProductionContry(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductionContryToJson(ProductionContry instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'name': instance.name,
    };
