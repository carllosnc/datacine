import '/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people_item.g.dart';

@JsonSerializable(explicitToJson: true)
class PeopleItem {
  @JsonKey(name: 'original_name')
  final String? originalName;

  @JsonKey(name: 'known_for_department')
  final String? knownForDepartment;

  @JsonKey(name: 'profile_path')
  final String? profilePath;

  @JsonKey(name: 'known_for')
  final List<MediaItem>? knownFor;

  final bool? adult;
  final num? id;
  final num? popularity;
  final num? gender;
  final String? character;
  final String? job;
  final String? department;

  PeopleItem({
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
  });

  factory PeopleItem.fromJson(Map<String, dynamic> json) =>
      _$PeopleItemFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleItemToJson(this);
}
