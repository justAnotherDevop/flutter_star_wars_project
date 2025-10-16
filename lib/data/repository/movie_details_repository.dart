
import 'package:flutter_star_wars_project/domain/models/character_domain.dart';
import 'package:flutter_star_wars_project/domain/models/planet_domain.dart';
import 'package:flutter_star_wars_project/domain/models/species_domain.dart';
import 'package:flutter_star_wars_project/domain/models/starship_domain.dart';
import 'package:flutter_star_wars_project/domain/models/vehicle_domain.dart';

abstract class MovieDetailsRepository {
  Future<CharacterDomain?> getCharacter(String url);

  Future<PlanetDomain?> getPlanet(String url);

  Future<SpeciesDomain?> getSpecies(String url);

  Future<StarshipDomain?> getStarship(String url);

  Future<VehicleDomain?> getVehicle(String url);
}
