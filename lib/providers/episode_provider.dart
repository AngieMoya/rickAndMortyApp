// import 'package:rick_and_morty/models/character_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/episode_model.dart';

class EpisodePrivoder {
  final url = 'https://rickandmortyapi.com/api/episode';

  Future<List<EpisodeModel>> getAll() async {
    List<EpisodeModel> characters = [];
    final resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonList = jsonDecode(body);
      for (var elemento in jsonList['results']) {
        final character = EpisodeModel.fromJson(elemento);
        characters.add(character);
      }
      return characters;
    } else {
      throw Exception('Failed to get all episodes');
    }
  }
}
