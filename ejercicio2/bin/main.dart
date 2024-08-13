import 'package:ejercicio2/models/character.dart';
import 'package:ejercicio2/services/api_service.dart';

void main(List<String> arguments) async {
  final apiService = ApiService();

  // Write how many characters you want to get from the API
  //in the function below
  int count = 3;
  
  List<Character> characters = await apiService.getCharacters(count);

  List<Character> charactersCached = await apiService.getCharacters(count);
  List<Character> charactersCached2 = await apiService.getCharacters(count);

  characters.forEach((character) => character.printCharacterDetails());
  /*print(characters[3].type);
  print(charactersCached[3].type);
  print(charactersCached2[3].type);
  */
}
