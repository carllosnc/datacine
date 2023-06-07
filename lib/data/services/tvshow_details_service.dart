import '/data/data.dart';
import 'package:http/http.dart' as http;
import '/domain/domain.dart';

class TvShowDetailsService {
  final TvShowDetailsRepository _tvShowDetailsRepository =
      TvShowDetailsRepository(http.Client());

  Future<TvShowDetails> getTVShow(String id) async {
    final response = await _tvShowDetailsRepository.getTvShowDetails(id: id);
    return _tvShowDetailsRepository.adapt(response);
  }
}
