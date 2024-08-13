import 'package:ejercicio2/mixins/cache_mixin.dart';
import 'package:ejercicio2/models/character_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ejercicio2/models/character.dart';

class ApiService with CacheMixin {
  final String _baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<Character>> getCharacters([int? count]) async {
    final cacheKey = 'Deadpool3lamejor';

    if (isCached(cacheKey)) {
      print('Fetching characters from cache...');
      return getFromCache(cacheKey);
    } 
    else {
      final response = await http.get(Uri.parse('$_baseUrl/character'));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final characterApi = CharacterApi.fromJson(json);
        List<Character> characters =
            characterApi.results.take(count ?? 1).toList();

        saveToCache(cacheKey, characters);
        return characters;
      } else {
        throw Exception('Failed to load characters');
      }
    }
  }
}
