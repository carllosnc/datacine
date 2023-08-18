import 'package:json_annotation/json_annotation.dart';
import '/imports/app.dart';

part 'collection.g.dart';

@JsonSerializable(explicitToJson: true)
class Collection {
  final num? id;
  final String? name;
  final String? overview;
  final List<MediaItem>? parts;

  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  Collection({
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.parts,
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
