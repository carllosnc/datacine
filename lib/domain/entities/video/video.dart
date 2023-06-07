import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable(explicitToJson: true)
class Video {
  @JsonKey(name: 'iso_639_1')
  String? iso6391;

  @JsonKey(name: 'iso_3166_1')
  String? iso31661;

  @JsonKey(name: 'published_at')
  String? publishedAt;

  String? id;
  String? key;
  String? name;
  String? site;
  String? type;
  num? size;
  bool? official;

  Video({
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
