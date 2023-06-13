import 'package:http/http.dart' as http;
import '/data/data.dart';
import '/domain/domain.dart';

class CollectionService {
  final CollectionRepository _collectionRepository =
      CollectionRepository(http.Client());

  Future<Collection> getCollection(String id) async {
    final response = await _collectionRepository.getCollection(id: id);
    return _collectionRepository.adapt(response);
  }
}
