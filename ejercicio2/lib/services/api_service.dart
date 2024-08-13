import 'package:ejercicio2/models/characterApi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ejercicio2/models/character.dart';

class ApiService {
  final String baseUrl = 'https://rickandmortyapi.com/api';

  Future<List<Character>> get10Characters(int count) async {
    final response = await http.get(Uri.parse('$baseUrl/character/?page=1'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final characterApi = CharacterApi.fromJson(json);
      return characterApi.results.take(count).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
