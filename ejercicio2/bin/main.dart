import 'package:ejercicio2/models/character.dart';
import 'package:ejercicio2/services/api_service.dart';
import 'package:http/http.dart';

void main(List<String> arguments) async {
  final apiService = ApiService();
  List<Character> characters = await apiService.get10Characters(10);
  for (var character in characters) {
    print('${character.name} is a ${character.species} and is ${character.status}');
  }
}
