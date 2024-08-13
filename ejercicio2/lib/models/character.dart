import 'package:ejercicio2/mixins/printable_mixin.dart';

class Character with PrintableMixin{
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'type': type,
        'gender': gender,
      };
  void printCharacterDetails(){
    printDetails('''ID:     $id\n 
                    Name:   $name\n
                    Status: $status\n
                    Species:$species\n
                    Type:   $type\n
                    Gender: $gender\n ''');
  }
}
