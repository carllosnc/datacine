import '/domain/domain.dart';

class PeopleItem {
  final bool adult;
  final num id;
  final String originalName;
  final num popularity;
  final num gender;
  final String knownForDepartment;
  final String profilePath;
  final List<MediaItem> knownFor;

  PeopleItem({
    required this.adult,
    required this.id,
    required this.originalName,
    required this.popularity,
    required this.gender,
    required this.knownForDepartment,
    required this.profilePath,
    required this.knownFor,
  });

  factory PeopleItem.fromJson(Map<String, dynamic> json) {
    return PeopleItem(
      adult: json['adult'],
      id: json['id'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      gender: json['gender'],
      knownForDepartment: json['known_for_department'],
      profilePath: json['profile_path'],
      knownFor: json['known_for']
          .map<MediaItem>((e) => MediaItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'id': id,
      'original_name': originalName,
      'popularity': popularity,
      'gender': gender,
      'known_for_department': knownForDepartment,
      'profile_path': profilePath,
      'known_for': knownFor.map((e) => e.toJson()).toList(),
    };
  }
}
