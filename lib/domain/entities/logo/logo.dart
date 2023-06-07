import 'package:json_annotation/json_annotation.dart';

part 'logo.g.dart';

@JsonSerializable(explicitToJson: true)
class Logo {
  @JsonKey(name: 'aspect_ratio')
  final num? aspectRatio;

  @JsonKey(name: 'file_path')
  final String? filePath;

  @JsonKey(name: 'iso_639_1')
  final String? iso6391;

  @JsonKey(name: 'vote_average')
  final num? voteAverage;

  @JsonKey(name: 'vote_count')
  final num? voteCount;

  final num? width;

  final num? height;

  Logo({
    required this.aspectRatio,
    required this.filePath,
    required this.height,
    required this.iso6391,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Logo.fromJson(Map<String, dynamic> json) => _$LogoFromJson(json);

  Map<String, dynamic> toJson() => _$LogoToJson(this);
}
