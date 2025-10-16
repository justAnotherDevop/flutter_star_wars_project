
import 'package:flutter_star_wars_project/domain/models/planet_domain.dart' as domain;

import '../domain/models/planet_domain.dart';

class Planet {
  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String surfaceWater;
  final String population;

  const Planet({
    required this.name,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surfaceWater,
    required this.population,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'] as String,
      rotationPeriod: json['rotation_period'] as String,
      orbitalPeriod: json['orbital_period'] as String,
      diameter: json['diameter'] as String,
      climate: json['climate'] as String,
      gravity: json['gravity'] as String,
      terrain: json['terrain'] as String,
      surfaceWater: json['surface_water'] as String,
      population: json['population'] as String,
    );
  }

  PlanetDomain toDomain() {
    return domain.PlanetDomain(
      name: name,
      rotationPeriod: rotationPeriod,
      climate: climate,
      gravity: gravity,
      terrain: terrain,
      population: population,
    );
  }
}
