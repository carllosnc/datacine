import 'package:json_annotation/json_annotation.dart';

part 'user_category.g.dart';

@JsonSerializable(explicitToJson: true)
class UserCategory {
  String id;
  String name;
  String description;

  UserCategory({
    required this.id,
    required this.name,
    required this.description,
  });

  factory UserCategory.fromJson(Map<String, dynamic> json) => _$UserCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$UserCategoryToJson(this);
}
