import 'package:json_annotation/json_annotation.dart';

part 'language.g.dart';

@JsonSerializable(explicitToJson: true)
class Language {
  @JsonKey(name: 'english_name')
  String? englishName;

  @JsonKey(name: 'iso_639_1')
  String? iso6391;

  String? name;

  Language({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}
