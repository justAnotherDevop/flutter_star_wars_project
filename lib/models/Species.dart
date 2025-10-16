
import 'package:flutter_star_wars_project/domain/models/species_domain.dart' as domain;

import '../domain/models/species_domain.dart';

class Species {
  final String name;
  final String classification;
  final String designation;
  final String averageHeight;
  final String skinColors;
  final String hairColors;
  final String eyeColors;
  final String averageLifespan;
  final String language;

  const Species({
    required this.name,
    required this.classification,
    required this.designation,
    required this.averageHeight,
    required this.skinColors,
    required this.hairColors,
    required this.eyeColors,
    required this.averageLifespan,
    required this.language,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'] as String,
      classification: json['classification'] as String,
      designation: json['designation'] as String,
      averageHeight: json['average_height'] as String,
      skinColors: json['skin_colors'] as String,
      hairColors: json['hair_colors'] as String,
      eyeColors: json['eye_colors'] as String,
      averageLifespan: json['average_lifespan'] as String,
      language: json['language'] as String,
    );
  }

  SpeciesDomain toDomain() {
    return domain.SpeciesDomain(
      name: name,
      averageLifespan: averageLifespan,
      language: language,
    );
  }
}
