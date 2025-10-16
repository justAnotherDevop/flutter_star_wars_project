
import 'package:flutter_star_wars_project/domain/models/movie.dart';

class Film {
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate; 
  final List<String> characters;
  final List<String> planets;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> species;

  Film({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json['title'] as String,
      episodeId: json['episode_id'] as int,
      openingCrawl: json['opening_crawl'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      releaseDate: json['release_date'] as String,
      characters: List<String>.from(json['characters'] as List<dynamic>),
      planets: List<String>.from(json['planets'] as List<dynamic>),
      starships: List<String>.from(json['starships'] as List<dynamic>),
      vehicles: List<String>.from(json['vehicles'] as List<dynamic>),
      species: List<String>.from(json['species'] as List<dynamic>),
    );
  }

  Movie toDomain() {
    return Movie(
      title: title,
      episodeId: episodeId,
      openingCrawl: openingCrawl,
      director: director,
      producer: producer,
      releaseDate: releaseDate,
      characters: characters,
      planets: planets,
      starships: starships,
      vehicles: vehicles,
      species: species,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'episode_id': episodeId,
      'opening_crawl': openingCrawl,
      'director': director,
      'producer': producer,
      'release_date': releaseDate,
      'characters': characters,
      'planets': planets,
      'starships': starships,
      'vehicles': vehicles,
      'species': species,
    };
  }

  @override
  String toString() {
    return 'FilmResult(title: $title, episodeId: $episodeId)';
  }
}

class FilmResponse {
  final int count;
  final String? next;
  final String? previous;
  final List<Film> films;

  FilmResponse({
    required this.count,
    this.next,
    this.previous,
    required this.films,
  });

  factory FilmResponse.fromJson(Map<String, dynamic> json) {
    var resultsList = json['results'] as List<dynamic>;
    List<Film> filmResults = resultsList
        .map((i) => Film.fromJson(i as Map<String, dynamic>))
        .toList();

    return FilmResponse(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      films: filmResults,
    );
  }

  List<Movie> toDomain() {
    return films.map((film) => film.toDomain()).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': films.map((film) => film.toJson()).toList(),
    };
  }
}
