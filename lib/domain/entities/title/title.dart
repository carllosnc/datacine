import 'package:json_annotation/json_annotation.dart';

part 'title.g.dart';

@JsonSerializable(explicitToJson: true)
class Title {
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;

  String? title;

  String? type;

  Title({
    required this.iso31661,
    required this.title,
    required this.type,
  });

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
}
