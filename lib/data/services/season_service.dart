import 'dart:convert';
import '/data/data.dart';
import '/domain/domain.dart';
import 'package:http/http.dart' as http;

class SeasonService {
  final SeasonRepository _seasonRepository = SeasonRepository(http.Client());

  Future<Season> getSeason({
    required int tvshowId,
    required int seasonNumber,
  }) async {
    final response = await _seasonRepository.getSeason(
      tvshowId: tvshowId,
      seasonNumber: seasonNumber,
    );

    return Season.fromJson(jsonDecode(response.body));
  }
}
