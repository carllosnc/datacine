import 'package:json_annotation/json_annotation.dart';

part 'production_company.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductionCompany {
  @JsonKey(name: 'logo_path')
  final String? logoPath;

  @JsonKey(name: 'origin_country')
  final String? originCountry;

  final num? id;

  final String? name;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}
