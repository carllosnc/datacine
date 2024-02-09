import 'package:json_annotation/json_annotation.dart';
import '/imports/app.dart';

part 'user_tvshow.g.dart';

@JsonSerializable(explicitToJson: true)
class UserTvshow {
  String id;
  String cover;
  String name;
  String date;
  String backdrop;
  UserCategory userCategory;

  UserTvshow({
    required this.id,
    required this.cover,
    required this.name,
    required this.date,
    required this.backdrop,
    required this.userCategory,
  });
}
