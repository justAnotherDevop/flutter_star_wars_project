class Starship {
  final String name;
  final String model;
  final String manufacturer;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String starshipClass;
  
  const Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.starshipClass,
  });

  factory Starship.fromJson(Map<String, dynamic> json) {
    return Starship(
      name: json['name'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      crew: json['crew'] as String,
      passengers: json['passengers'] as String,
      cargoCapacity: json['cargo_capacity'] as String,
      starshipClass: json['starship_class'] as String,
    );
  }
}