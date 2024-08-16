import 'package:ejercicio2/mixins/cache_mixin.dart';
import 'package:ejercicio2/models/character_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ejercicio2/models/character.dart';

class ApiService with CacheMixin {
  final String _baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<Character>> getCharactersByPage([int? page]) async {
    final cacheKey = 'Deadpool3lamejor';

    if (isCached(cacheKey)) {
      print('Fetching characters from cache...');
      return getFromCache(cacheKey);
    }

    final response =
        await http.get(Uri.parse('$_baseUrl/character/?page=${page ?? 1}'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final characterApi = CharacterApi.fromJson(json);
      List<Character> characters = characterApi.results.toList();

      saveToCache(cacheKey, characters);
      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<Character> getCharacterById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/character/$id'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Character.fromJson(json);
    } else {
      throw Exception('Failed to load character');
    }
  }

  Stream<List<Character>> getAllCharacters([int pages = 20]) async* {
    for (int i = 1; i <= pages; i++) {
      final response =
          await http.get(Uri.parse('$_baseUrl/character/?page=$i'));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final characterApi = CharacterApi.fromJson(json);
        yield characterApi.results;
      } else {
        throw Exception('Failed to load characters');
      }
    }
  }
}
