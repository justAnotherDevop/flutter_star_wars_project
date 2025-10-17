part of 'movie_details_cubit.dart';

enum Status { initial, loading, success, error }

sealed class MovieDetailItem extends Equatable {
  final String title;

  const MovieDetailItem({required this.title});

  @override
  List<Object> get props => [title];
}

final class CharactersItem extends MovieDetailItem {
  final List<CharacterDomain> characters;

  const CharactersItem({required this.characters}) : super(title: "Characters");

  @override
  List<Object> get props => [title, characters];
}

final class PlanetsItem extends MovieDetailItem {
  final List<PlanetDomain> planets;

  const PlanetsItem({required this.planets}) : super(title: "Planets");

  @override
  List<Object> get props => [title, planets];
}

final class StarshipsItem extends MovieDetailItem {
  final List<StarshipDomain> starships;

  const StarshipsItem({required this.starships}) : super(title: "Starships");

  @override
  List<Object> get props => [title, starships];
}

final class VehiclesItem extends MovieDetailItem {
  final List<VehicleDomain> vehicles;

  const VehiclesItem({required this.vehicles}) : super(title: "Vehicles");

  @override
  List<Object> get props => [title, vehicles];
}

final class SpeciesItem extends MovieDetailItem {
  final List<SpeciesDomain> species;

  const SpeciesItem({required this.species}) : super(title: "Species");

  @override
  List<Object> get props => [title, species];
}

class MovieDetailsState extends Equatable {
  const MovieDetailsState({
    required this.status,
    this.movieTitle = "",
    this.errorMessage = "",
    this.detailItems = const [],
    this.charactersEndpoints = const [],
    this.planetsEndpoints = const [],
    this.starshipsEndpoints = const [],
    this.vehiclesEndpoints = const [],
    this.speciesEndpoints = const [],
  });

  final Status status;
  final List<MovieDetailItem> detailItems;
  final List<String> charactersEndpoints;
  final List<String> planetsEndpoints;
  final List<String> starshipsEndpoints;
  final List<String> vehiclesEndpoints;
  final List<String> speciesEndpoints;
  final String movieTitle;
  final String errorMessage;

  factory MovieDetailsState.initial() {
    return MovieDetailsState(status: Status.initial);
  }

  @override
  List<Object> get props => [
    status,
    detailItems,
    charactersEndpoints,
    planetsEndpoints,
    starshipsEndpoints,
    vehiclesEndpoints,
    speciesEndpoints,
    movieTitle,
    errorMessage,
  ];

  MovieDetailsState copyWith({
    required Status status,
    String? movieTitle,
    String? errorMessage,
    List<MovieDetailItem>? detailItems,
    List<String>? peopleEndpoints,
    List<String>? planetsEndpoints,
    List<String>? starshipsEndpoints,
    List<String>? vehiclesEndpoints,
    List<String>? speciesEndpoints,
  }) {
    return MovieDetailsState(
      status: status,
      movieTitle: movieTitle ?? this.movieTitle,
      detailItems: detailItems ?? this.detailItems,
      charactersEndpoints: peopleEndpoints ?? this.charactersEndpoints,
      planetsEndpoints: planetsEndpoints ?? this.planetsEndpoints,
      starshipsEndpoints: starshipsEndpoints ?? this.starshipsEndpoints,
      vehiclesEndpoints: vehiclesEndpoints ?? this.vehiclesEndpoints,
      speciesEndpoints: speciesEndpoints ?? this.speciesEndpoints,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
