import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/models/Species.dart';
import 'package:flutter_star_wars_project/models/planet.dart';
import 'package:flutter_star_wars_project/models/starship.dart';
import 'package:flutter_star_wars_project/models/vehicle.dart';

import '../data/repository/movie_details_repository.dart';
import '../models/character.dart';

class MovieDetailsProvider with ChangeNotifier {
  final _movieDetailsRepo = MovieDetailsRepository();

  List<String> _peopleEndpoints = [];
  List<String> _planetsEndpoints = [];
  List<String> _starshipsEndpoints = [];
  List<String> _vehiclesEndpoints = [];
  List<String> _speciesEndpoints = [];

  DataStatus _status = DataStatus.initial;

  DataStatus get status => _status;

  String _movieTitle = "";

  String get movieTitle => _movieTitle;

  List<DetailItem> _detailItems = [];

  List<DetailItem> get detailItems => _detailItems;

  void updatePeopleEndpoints({
    required List<String> peopleEndpoints,
    required List<String> planetsEndpoints,
    required List<String> starshipsEndpoints,
    required List<String> vehicleEndpoints,
    required List<String> speciesEndpoints,
  }) {
    _detailItems.clear();
    _status = DataStatus.initial;
    _peopleEndpoints = peopleEndpoints;
    // above code seems hacky - need to find a better way of resetting state
    _planetsEndpoints = planetsEndpoints;
    _starshipsEndpoints = starshipsEndpoints;
    _vehiclesEndpoints = vehicleEndpoints;
    _speciesEndpoints = speciesEndpoints;

    notifyListeners();
  }

  void updateMovieTitle(String movieTitle) {
    _movieTitle = movieTitle;
    notifyListeners();
  }

  Future<void> loadDetails({bool refresh = false}) async {
    // load only once to avoid being called when widget is rebuilt
    if(_status == DataStatus.initial) {
      try {
        final characters = await _loadCharacters();
        final planets = await _loadPlanets();
        final vehicles = await _loadVehicles();
        final species = await _loadSpecies();
        final starships = await _loadStarships();

        _detailItems = [
          CharactersItem(characters: characters.nonNulls.toList()),
          PlanetsItem(planets: planets.nonNulls.toList()),
          VehiclesItem(vehicles: vehicles.nonNulls.toList()),
          SpeciesItem(species: species.nonNulls.toList()),
          StarshipsItem(starships: starships.nonNulls.toList()),
        ];

        _status = DataStatus.loaded;
      } catch (exception, trace) {
        _status = DataStatus.error;
        if (kDebugMode) {
          print("Error while fetching characters");
        }
      } finally {
        notifyListeners();
      }
    }
  }

  Future<List<Character?>> _loadCharacters() async {
    final List<Future<Character?>> parallelCharacterCalls = [];
    for (var url in _peopleEndpoints) {
      parallelCharacterCalls.add(_movieDetailsRepo.getCharacter(url));
    }
    try {
      final charactersResult = Future.wait(parallelCharacterCalls);
      return charactersResult;
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching characters");
      }
      return [];
    }
  }

  Future<List<Planet?>> _loadPlanets() async {
    try {
      final List<Future<Planet?>> parallelPlanetCalls = [];
      for (var url in _planetsEndpoints) {
        parallelPlanetCalls.add(_movieDetailsRepo.getPlanet(url));
      }
      final planetsResult = Future.wait(parallelPlanetCalls);
      return planetsResult;
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching planets");
      }
      return [];
    }
  }

  Future<List<Starship?>> _loadStarships() async {
    try {
      final List<Future<Starship?>> parallelStarshipCalls = [];
      for (var url in _starshipsEndpoints) {
        parallelStarshipCalls.add(_movieDetailsRepo.getStarship(url));
      }
      final starshipResults = Future.wait(parallelStarshipCalls);
      return starshipResults;
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching starships");
      }
      return [];
    }
  }

  Future<List<Vehicle?>> _loadVehicles() async {
    try {
      final List<Future<Vehicle?>> parallelVehiclesCalls = [];
      for (var url in _vehiclesEndpoints) {
        parallelVehiclesCalls.add(_movieDetailsRepo.getVehicle(url));
      }
      final vehiclesResult = Future.wait(parallelVehiclesCalls);
      return vehiclesResult;
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching vehicles");
      }
      return [];
    }
  }

  Future<List<Species?>> _loadSpecies() async {
    try {
      final List<Future<Species?>> speciesParallelCalls = [];
      for (var url in _speciesEndpoints) {
        speciesParallelCalls.add(_movieDetailsRepo.getSpecies(url));
      }
      final speciesResult = Future.wait(speciesParallelCalls);
      return speciesResult;
    } catch (exception, trace) {
      if (kDebugMode) {
        print("Error while fetching species");
      }
      return [];
    }
  }
}

enum DataStatus { initial, loading, loaded, error }

sealed class DetailItem {}

final class CharactersItem extends DetailItem {
  final title = "Characters";
  final List<Character> characters;

  CharactersItem({required this.characters});
}

final class PlanetsItem extends DetailItem {
  final title = "Planets";
  final List<Planet> planets;

  PlanetsItem({required this.planets});
}

final class StarshipsItem extends DetailItem {
  final title = "Starships";
  final List<Starship> starships;

  StarshipsItem({required this.starships});
}

final class VehiclesItem extends DetailItem {
  final title = "Vehicles";
  final List<Vehicle> vehicles;

  VehiclesItem({required this.vehicles});
}

final class SpeciesItem extends DetailItem {
  final title = "Species";
  final List<Species> species;

  SpeciesItem({required this.species});
}
