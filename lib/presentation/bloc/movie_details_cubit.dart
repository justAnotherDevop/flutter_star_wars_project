import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_star_wars_project/domain/models/character_domain.dart';
import 'package:flutter_star_wars_project/domain/models/planet_domain.dart';
import 'package:flutter_star_wars_project/domain/models/species_domain.dart';
import 'package:flutter_star_wars_project/domain/models/starship_domain.dart';
import 'package:flutter_star_wars_project/domain/models/vehicle_domain.dart';

import '../../domain/get_characters_use_case.dart';
import '../../domain/get_planets_use_case.dart';
import '../../domain/get_species_use_case.dart';
import '../../domain/get_starships_use_case.dart';
import '../../domain/get_vehicles_use_case.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsState.initial());

  final getCharactersUseCase = GetCharactersUseCase();
  final getPlanetsUseCase = GetPlanetsUseCase();
  final getVehiclesUseCase = GetVehiclesUseCase();
  final getSpeciesUseCase = GetSpeciesUseCase();
  final getStarshipsUseCase = GetStarshipsUseCase();

  Future<void> loadDetails() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final characters = await getCharactersUseCase.execute(
        state.charactersEndpoints,
      );
      final planets = await getPlanetsUseCase.execute(state.planetsEndpoints);
      final vehicles = await getVehiclesUseCase.execute(
        state.vehiclesEndpoints,
      );
      final species = await getSpeciesUseCase.execute(state.speciesEndpoints);
      final starships = await getStarshipsUseCase.execute(
        state.starshipsEndpoints,
      );

      emit(
        state.copyWith(
          status: Status.success,
          detailItems: [
            CharactersItem(characters: characters.nonNulls.toList()),
            PlanetsItem(planets: planets.nonNulls.toList()),
            VehiclesItem(vehicles: vehicles.nonNulls.toList()),
            SpeciesItem(species: species.nonNulls.toList()),
            StarshipsItem(starships: starships.nonNulls.toList()),
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
