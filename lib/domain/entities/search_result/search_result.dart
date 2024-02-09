import 'package:json_annotation/json_annotation.dart';

part 'search_result.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchResult {
  final num? page;

  @JsonKey(name: 'total_pages')
  final num? totalPages;

  @JsonKey(name: 'total_results')
  final num? totalResults;

  List<dynamic>? results;

  SearchResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) => _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);
}
