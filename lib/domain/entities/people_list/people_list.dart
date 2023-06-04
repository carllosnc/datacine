import '/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'people_list.g.dart';

@JsonSerializable(explicitToJson: true)
class PeopleList {
  @JsonKey(name: 'total_pages')
  final num? totalPages;

  @JsonKey(name: 'total_results')
  final num? totalResults;

  final num? page;

  final List<PeopleItem>? results;

  PeopleList({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PeopleList.fromJson(Map<String, dynamic> json) =>
      _$PeopleListFromJson(json);

  Map<String, dynamic> toJson() => _$PeopleListToJson(this);
}
