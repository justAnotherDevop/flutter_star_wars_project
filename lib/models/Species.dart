class Species {
  final String name;
  final String classification;
  final String designation;
  final String averageHeight;
  final String averageLifespan;
  final String language;

  const Species({
    required this.name,
    required this.classification,
    required this.designation,
    required this.averageHeight,
    required this.averageLifespan,
    required this.language,
  });

  factory Species.fromJson(Map<String, dynamic> json) {
    return Species(
      name: json['name'] as String,
      classification: json['classification'] as String,
      designation: json['designation'] as String,
      averageHeight: json['average_height'] as String,
      averageLifespan: json['average_lifespan'] as String,
      language: json['language'] as String,
    );
  }
}