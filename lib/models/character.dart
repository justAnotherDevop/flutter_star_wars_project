
import 'package:flutter_star_wars_project/domain/models/character_domain.dart' as domain;

import '../domain/models/character_domain.dart';

class Character {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;

  const Character({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'] as String,
      height: json['height'] as String,
      mass: json['mass'] as String,
      hairColor: json['hair_color'] as String,
      skinColor: json['skin_color'] as String,
      eyeColor: json['eye_color'] as String,
      birthYear: json['birth_year'] as String,
      gender: json['gender'] as String,
    );
  }

  CharacterDomain toDomain() {
    return domain.CharacterDomain(
      name: name,
      birthYear: birthYear,
      gender: gender,
    );
  }
}
