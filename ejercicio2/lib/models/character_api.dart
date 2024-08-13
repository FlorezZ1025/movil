import 'package:ejercicio2/models/character.dart';

class CharacterApi{
  final int count;
  final List<Character> results;

  CharacterApi({
    required this.count,
    required this.results,
  });

  factory CharacterApi.fromJson(Map<String, dynamic> json) {
    return CharacterApi(
      count: json['info']['count'],
      results: List<Character>.from(json['results'].map((i) => Character.fromJson(i))),
    );  
  }
}