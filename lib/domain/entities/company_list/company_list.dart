import '/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_list.g.dart';

@JsonSerializable(explicitToJson: true)
class CompanyList {
  final num? page;

  @JsonKey(name: 'total_pages')
  final num? totalPages;

  @JsonKey(name: 'total_results')
  final num? totalResults;

  final List<Company>? results;

  CompanyList({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory CompanyList.fromJson(Map<String, dynamic> json) =>
      _$CompanyListFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyListToJson(this);
}
