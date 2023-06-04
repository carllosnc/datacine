import 'package:json_annotation/json_annotation.dart';

part 'poster.g.dart';

@JsonSerializable(explicitToJson: true)
class Poster {
  @JsonKey(name: 'aspect_ratio')
  num? aspectRatio;

  @JsonKey(name: 'file_path')
  String? filePath;

  @JsonKey(name: 'iso_639_1')
  String? iso6391;

  @JsonKey(name: 'vote_average')
  num? voteAverage;

  @JsonKey(name: 'vote_count')
  num? voteCount;

  num? height;

  num? width;

  Poster({
    required this.aspectRatio,
    required this.filePath,
    required this.height,
    required this.iso6391,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => _$PosterFromJson(json);

  Map<String, dynamic> toJson() => _$PosterToJson(this);
}
