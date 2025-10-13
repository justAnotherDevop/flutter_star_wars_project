class Vehicle {
  final String name;
  final String model;
  final String manufacturer;
  final String maxSpeed;
  final String cargoCapacity;
  final String vehicleClass;

  const Vehicle({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.maxSpeed,
    required this.cargoCapacity,
    required this.vehicleClass,
  });

  /// Factory constructor to create a Vehicle from a JSON object.
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      name: json['name'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      maxSpeed: json['max_atmosphering_speed'] as String,
      cargoCapacity: json['cargo_capacity'] as String,
      vehicleClass: json['vehicle_class'] as String,
    );
  }
}