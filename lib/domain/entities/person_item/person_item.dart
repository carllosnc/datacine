import 'package:json_annotation/json_annotation.dart';
import '/imports/app.dart';

part 'person_item.g.dart';

@JsonSerializable(explicitToJson: true)
class PersonItem {
  @JsonKey(name: 'original_name')
  final String? originalName;

  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  @JsonKey(name: 'known_for')
  final List<MediaItem>? knownFor;

  @JsonKey(name: 'media_type')
  final String? mediaType;

  final String? name;

  final bool? adult;

  final num? id;

  final num? popularity;

  final num? gender;

  final String? character;

  final String? job;

  final String? department;

  PersonItem({
    required this.adult,
    required this.id,
    required this.originalName,
    required this.popularity,
    required this.gender,
    required this.knownForDepartment,
    required this.profilePath,
    required this.knownFor,
    required this.character,
    required this.job,
    required this.department,
    required this.name,
    required this.mediaType,
  });

  factory PersonItem.fromJson(Map<String, dynamic> json) =>
      _$PersonItemFromJson(json);

  Map<String, dynamic> toJson() => _$PersonItemToJson(this);
}
