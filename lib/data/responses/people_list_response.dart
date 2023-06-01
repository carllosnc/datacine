import 'package:giganoid_app/domain/entities/people_item.dart';

import '/domain/domain.dart';

class PeopleListResponse {
  final num page;
  final num totalPages;
  final num totalResults;
  final List<PeopleItem> results;

  PeopleListResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory PeopleListResponse.fromJson(Map<String, dynamic> json) {
    return PeopleListResponse(
      page: json['page'],
      results: List<PeopleItem>.from(
        json['results'].map(
          (x) => PeopleItem.fromJson(x),
        ),
      ),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results.map((e) => e.toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }
}
