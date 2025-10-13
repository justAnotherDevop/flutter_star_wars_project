class Character {
  final String name;
  final String birthYear;
  final String gender;

  const Character({
    required this.name,
    required this.birthYear,
    required this.gender,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] as String,
      birthYear: json['birth_year'] as String,
      gender: json['gender'] as String,
    );
  }
}