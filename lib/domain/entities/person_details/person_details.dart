import 'package:json_annotation/json_annotation.dart';
import '/domain/domain.dart';

part 'person_details.g.dart';

@JsonSerializable(explicitToJson: true)
class PersonDetails {
  @JsonKey(name: 'also_known_as')
  List<String>? alsoKnownAs;

  @JsonKey(name: 'imdb_id')
  String? imdbId;

  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;

  @JsonKey(name: 'place_of_birth')
  String? placeOfBirth;

  @JsonKey(name: 'profile_path')
  String? profilePath;

  @JsonKey(name: 'movie_credits')
  Map<String, List<MediaItem>>? movieCredits;

  @JsonKey(name: 'tv_credits')
  Map<String, List<MediaItem>>? tvCredits;

  @JsonKey(name: 'combined_credits')
  Map<String, List<MediaItem>>? combinedCredits;

  @JsonKey(name: 'external_ids')
  Map<String, dynamic>? externalIds;

  int? id;

  String? name;

  bool? adult;

  String? biography;

  String? birthday;

  String? deathday;

  int? gender;

  String? homepage;

  double? popularity;

  Map<String, List<ImageItem>?>? images;

  PersonDetails({
    this.id,
    this.name,
    this.adult,
    this.biography,
    this.birthday,
    this.deathday,
    this.gender,
    this.homepage,
    this.popularity,
    this.images,
    this.alsoKnownAs,
    this.imdbId,
    this.knownForDepartment,
    this.placeOfBirth,
    this.profilePath,
    this.movieCredits,
    this.tvCredits,
    this.combinedCredits,
    this.externalIds,
  });

  factory PersonDetails.fromJson(Map<String, dynamic> json) =>
      _$PersonDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDetailsToJson(this);
}
