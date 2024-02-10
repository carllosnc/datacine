import 'package:json_annotation/json_annotation.dart';
import '/imports/app.dart';

part 'user_movie.g.dart';

@JsonSerializable(explicitToJson: true)
class UserMovie {
  String id;
  String cover;
  String title;
  String date;
  String backdrop;
  UserCategory userCategory;

  UserMovie({
    required this.id,
    required this.cover,
    required this.title,
    required this.date,
    required this.backdrop,
    required this.userCategory,
  });

  factory UserMovie.fromJson(Map<String, dynamic> json) => _$UserMovieFromJson(json);
  Map<String, dynamic> toJson() => _$UserMovieToJson(this);
}
