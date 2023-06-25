import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable(explicitToJson: true)
class Company {
  final int id;

  @JsonKey(name: 'logo_path')
  final String? logoPath;

  final String? name;

  @JsonKey(name: 'origin_country')
  final String? originCountry;

  Company({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
