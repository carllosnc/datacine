import '/domain/domain.dart';

class MediaListResponse {
  final num page;
  final num totalPages;
  final num totalResults;
  final List<MediaItem> results;

  MediaListResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MediaListResponse.fromJson(Map<String, dynamic> json) {
    return MediaListResponse(
      page: json['page'],
      results: List<MediaItem>.from(
        json['results'].map(
          (x) => MediaItem.fromJson(x),
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
