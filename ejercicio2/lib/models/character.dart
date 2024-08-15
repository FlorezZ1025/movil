
class Character{
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'species': species,
        'gender': gender,
      };

  @override
  String toString(){
    return 'ID: $id || Name: $name || Status: $status || Species: $species || Gender: $gender';
  }
}
