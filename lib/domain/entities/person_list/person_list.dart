import 'package:json_annotation/json_annotation.dart';
import '/imports.dart';

part 'person_list.g.dart';

@JsonSerializable(explicitToJson: true)
class PersonList {
  @JsonKey(name: 'total_pages')
  final num? totalPages;

  @JsonKey(name: 'total_results')
  final num? totalResults;

  final num? page;

  final List<PersonItem>? results;

  PersonList({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PersonList.fromJson(Map<String, dynamic> json) => _$PersonListFromJson(json);

  Map<String, dynamic> toJson() => _$PersonListToJson(this);
}
