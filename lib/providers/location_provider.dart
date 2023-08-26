// import 'package:rick_and_morty/models/character_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/location_model.dart';

class LocationPrivoder {
  final url = 'https://rickandmortyapi.com/api/location?page=';

  Future<List<LocationModel>> getAll(page) async {
    List<LocationModel> characters = [];
    final resp = await http.get(Uri.parse('$url$page'));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonList = jsonDecode(body);
      for (var elemento in jsonList['results']) {
        final character = LocationModel.fromJson(elemento);
        characters.add(character);
      }
      return characters;
    } else {
      throw Exception('Failed to get all locations');
    }
  }
}
