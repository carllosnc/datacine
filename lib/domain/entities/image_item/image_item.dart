import 'package:json_annotation/json_annotation.dart';

part 'image_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ImageItem {
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

  num? width;

  num? height;

  ImageItem({
    required this.aspectRatio,
    required this.filePath,
    required this.height,
    required this.iso6391,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory ImageItem.fromJson(Map<String, dynamic> json) =>
      _$ImageItemFromJson(json);

  Map<String, dynamic> toJson() => _$ImageItemToJson(this);
}
