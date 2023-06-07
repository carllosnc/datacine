import 'package:json_annotation/json_annotation.dart';

part 'keyword.g.dart';

@JsonSerializable(explicitToJson: true)
class Keyword {
  final num? id;
  final String? name;

  Keyword({
    required this.id,
    required this.name,
  });

  factory Keyword.fromJson(Map<String, dynamic> json) =>
      _$KeywordFromJson(json);

  Map<String, dynamic> toJson() => _$KeywordToJson(this);
}
