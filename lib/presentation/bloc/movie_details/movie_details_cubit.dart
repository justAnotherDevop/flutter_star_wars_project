import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/domain/models/character_domain.dart';
import 'package:flutter_star_wars_project/domain/models/planet_domain.dart';
import 'package:flutter_star_wars_project/domain/models/species_domain.dart';
import 'package:flutter_star_wars_project/domain/models/starship_domain.dart';
import 'package:flutter_star_wars_project/domain/models/vehicle_domain.dart';
import 'package:flutter_star_wars_project/domain/usecase/get_characters_use_case.dart';
import 'package:flutter_star_wars_project/domain/usecase/get_planets_use_case.dart';
import 'package:flutter_star_wars_project/domain/usecase/get_species_use_case.dart';
import 'package:flutter_star_wars_project/domain/usecase/get_starships_use_case.dart';
import 'package:flutter_star_wars_project/domain/usecase/get_vehicles_use_case.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsState.initial());

  final getCharactersUseCase = GetCharactersUseCase();
  final getPlanetsUseCase = GetPlanetsUseCase();
  final getVehiclesUseCase = GetVehiclesUseCase();
  final getSpeciesUseCase = GetSpeciesUseCase();
  final getStarshipsUseCase = GetStarshipsUseCase();
  List<CharacterDomain> _characters = [];
  List<PlanetDomain> _planets = [];
  List<VehicleDomain> _vehicles = [];
  List<SpeciesDomain> _species = [];
  List<StarshipDomain> _starships = [];

  Future<void> loadDetails() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final characters = await getCharactersUseCase.execute(
        state.charactersEndpoints,
      );
      characters.fold(
        (error) => emit(state.copyWith(status: Status.error, errorMessage: error.toString())),
        (results) {
          _characters = results.nonNulls.toList();
        },
      );

      final planets = await getPlanetsUseCase.execute(state.planetsEndpoints);
      planets.fold(
            (error) => emit(state.copyWith(status: Status.error, errorMessage: error.toString())),
            (results) {
          _planets = results.nonNulls.toList();
        },
      );

      final vehicles = await getVehiclesUseCase.execute(
        state.vehiclesEndpoints,
      );
      vehicles.fold(
            (error) => emit(state.copyWith(status: Status.error, errorMessage: error.toString())),
            (results) {
          _vehicles = results.nonNulls.toList();
        },
      );

      final species = await getSpeciesUseCase.execute(state.speciesEndpoints);
      species.fold(
            (error) => emit(state.copyWith(status: Status.error, errorMessage: error.toString())),
            (results) {
          _species = results.nonNulls.toList();
        },
      );

      final starships = await getStarshipsUseCase.execute(
        state.starshipsEndpoints,
      );
      starships.fold(
            (error) => emit(state.copyWith(status: Status.error, errorMessage: error.toString())),
            (results) {
          _starships = results.nonNulls.toList();
        },
      );

      emit(
        state.copyWith(
          status: Status.success,
          detailItems: [
            CharactersItem(characters: _characters),
            PlanetsItem(planets: _planets),
            VehiclesItem(vehicles: _vehicles),
            SpeciesItem(species: _species),
            StarshipsItem(starships: _starships),
          ],
        ),
      );
    } catch (exception, trace) {
      emit(state.copyWith(status: Status.error));

      if (kDebugMode) {
        print("Error while loading movie details: $exception\n$trace");
      }
    }
  }

  setMovieTitle(String title) {
    emit(state.copyWith(status: Status.initial, movieTitle: title));
  }

  updateUrlEndpoints({
    required List<String> charactersEndpoints,
    required List<String> planetsEndpoints,
    required List<String> starshipsEndpoints,
    required List<String> vehiclesEndpoints,
    required List<String> speciesEndpoints,
  }) {
    emit(
      state.copyWith(
        status: Status.initial,
        peopleEndpoints: charactersEndpoints,
        planetsEndpoints: planetsEndpoints,
        starshipsEndpoints: starshipsEndpoints,
        vehiclesEndpoints: vehiclesEndpoints,
        speciesEndpoints: speciesEndpoints,
      ),
    );
  }
}
