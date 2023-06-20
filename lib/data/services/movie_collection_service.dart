import 'dart:convert';
import 'package:http/http.dart' as http;
import '/data/data.dart';
import '/domain/domain.dart';

class MovieCollectionService {
  final MovieCollectionRepository _collectionRepository =
      MovieCollectionRepository(http.Client());

  Future<Collection> getCollection(String id) async {
    final response = await _collectionRepository.getCollection(id: id);
    return Collection.fromJson(jsonDecode(response.body));
  }
}
