class Planet {
  final String name;
  final String climate;
  final String gravity;
  final String terrain;
  final String surfaceWater;
  final String population;

  const Planet({
    required this.name,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surfaceWater,
    required this.population,
  });

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      name: json['name'] as String,
      climate: json['climate'] as String,
      gravity: json['gravity'] as String,
      terrain: json['terrain'] as String,
      surfaceWater: json['surface_water'] as String,
      population: json['population'] as String,
    );
  }
}