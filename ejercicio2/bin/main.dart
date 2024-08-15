import 'package:ejercicio2/models/character.dart';
import 'package:ejercicio2/services/api_service.dart';

void main(List<String> arguments) async {
  final apiService = ApiService();

  // Write how many characters you want to get from the API
  //in the function below
/*
  List<Character> characters = await apiService.getCharacters(count);
  List<Character> charactersCached = await apiService.getCharacters(count);
  List<Character> charactersCached2 = await apiService.getCharacters(count);

  characters.forEach((character) => print(character));

  Character character = await apiService.getCharacterById(18);
  print(character);
  
  print(characters[0].species);
  print(charactersCached[0].species);
  print(charactersCached2[0].species);  
*/
  // ignore: unused_local_variable
  await for (var charByPage in apiService.getAllCharacters(40)) {
    charByPage.forEach((character) => print(character));
  }
}
