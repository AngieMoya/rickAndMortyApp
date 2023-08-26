// import 'package:rick_and_morty/models/character_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rick_and_morty/models/character_model.dart';

class CharacterPrivoder{

  final url = 'https://rickandmortyapi.com/api/character?page=';

  Future<List<CharacterModel>> getAll(page) async {
    List<CharacterModel> characters = [];
    final resp = await http.get(Uri.parse('$url$page'));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonList = jsonDecode(body);
      for (var elemento in jsonList['results']) {
        final character = CharacterModel.fromJson(elemento);
        characters.add(character);
      }
      return characters;
    }else{
      throw Exception('Failed to get all characters');
    }
  }


}