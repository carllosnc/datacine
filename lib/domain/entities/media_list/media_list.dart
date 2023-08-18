import 'package:json_annotation/json_annotation.dart';
import '/imports/app.dart';

part 'media_list.g.dart';

@JsonSerializable(explicitToJson: true)
class MediaList {
  final num? page;

  @JsonKey(name: 'total_pages')
  final num? totalPages;

  @JsonKey(name: 'total_results')
  final num? totalResults;

  final List<MediaItem>? results;

  MediaList({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MediaList.fromJson(Map<String, dynamic> json) =>
      _$MediaListFromJson(json);

  Map<String, dynamic> toJson() => _$MediaListToJson(this);
}
