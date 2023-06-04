import 'package:json_annotation/json_annotation.dart';

part 'production_country.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductionContry {
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;

  String? name;

  ProductionContry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionContry.fromJson(Map<String, dynamic> json) =>
      _$ProductionContryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionContryToJson(this);
}
