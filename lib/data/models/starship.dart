
import 'package:flutter_star_wars_project/domain/models/starship_domain.dart' as domain;

import '../../domain/models/starship_domain.dart';

class Starship {
  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String hyperdriveRating;
  final String mglt;
  final String starshipClass;

  const Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.hyperdriveRating,
    required this.mglt,
    required this.starshipClass,
  });

  factory Starship.fromJson(Map<String, dynamic> json) {
    return Starship(
      name: json['name'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      costInCredits: json['cost_in_credits'] as String,
      length: json['length'] as String,
      maxAtmospheringSpeed: json['max_atmosphering_speed'] as String,
      crew: json['crew'] as String,
      passengers: json['passengers'] as String,
      cargoCapacity: json['cargo_capacity'] as String,
      consumables: json['consumables'] as String,
      hyperdriveRating: json['hyperdrive_rating'] as String,
      mglt: json['MGLT'] as String,
      starshipClass: json['starship_class'] as String,
    );
  }

  StarshipDomain toDomain() {
    return domain.StarshipDomain(
      name: name,
      model: model,
      manufacturer: manufacturer,
      costInCredits: costInCredits,
      cargoCapacity: cargoCapacity,
    );
  }
}
