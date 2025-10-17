
import 'package:flutter_star_wars_project/domain/models/vehicle_domain.dart' as domain;

import '../../domain/models/vehicle_domain.dart';

class Vehicle {
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
  final String vehicleClass;

  const Vehicle({
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
    required this.vehicleClass,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
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
      vehicleClass: json['vehicle_class'] as String,
    );
  }

  VehicleDomain toDomain() {
    return domain.VehicleDomain(
      name: name,
      model: model,
      manufacturer: manufacturer,
      costInCredits: costInCredits,
      cargoCapacity: cargoCapacity,
    );
  }
}
