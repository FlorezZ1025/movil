import 'package:ejercicio2/models/character.dart';
import 'package:ejercicio2/services/api_service.dart';

void main(List<String> arguments) async {
  final apiService = ApiService();

  //--------------Personajes por página (Máximo 43)

  int page = 32;
  List<Character> characters = await apiService.getCharactersByPage(page);

  //Para verificar el funcionamiento del mixin de cache
  // ignore: unused_local_variable
  List<Character> charactersCached = await apiService.getCharactersByPage(page);
  
  characters.forEach((character) => print('$character'));


  //--------------Personaje dado un ID (desde el 1 hasta el 826)
  /*
  int Id = 796;
  Character characterById = await apiService.getCharacterById(Id);
  print(characterById);
*/

  //-------------Todos los personajes hasta la página dada (desde la 1 hasta la 42)
  /*
  int pages = 42;
  
  await for (List<Character> charByPage in apiService.getAllCharacters(pages)) {
    charByPage.forEach((character) => print(character));
  }*/
}
