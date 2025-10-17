import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_star_wars_project/presentation/widgets/movie_detail_row.dart';
import '../bloc/movie_details/movie_details_cubit.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieDetailsCubit>().loadDetails();

    return BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white10,
            title: Text(state.movieTitle),
          ),
          body: Builder(
            builder: (_) {
              switch (state.status) {
                case Status.initial:
                case Status.loading:
                  return Center(child: CircularProgressIndicator());

                case Status.success:
                  return ListView.builder(
                    padding: EdgeInsetsGeometry.all(10),
                    itemCount: state.detailItems.length,
                    itemBuilder: (context, index) {
                      final currentRowItem = state.detailItems[index];

                      return switch (currentRowItem) {
                        CharactersItem() => MovieDetailRow(
                          title: currentRowItem.title,
                          itemCount: currentRowItem.characters.length,
                          itemBuilder: (context, index) {
                            final character = currentRowItem.characters[index];
                            final genderSymbol = switch (character.gender.toLowerCase()) {
                              'female' => '💃',
                              'male' => '👦',
                              'n/a' || 'none' => '👽',
                              _ => ' 🤖',
                            };
                            return Card(
                              child: SizedBox(
                                width: 250,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: '${character.name} ($genderSymbol)',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                        ),
                                        TextSpan(
                                          text:
                                              '\n\nDoB: ${character.birthYear}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        PlanetsItem() => MovieDetailRow(
                          rowHeight: 200,
                          title: currentRowItem.title,
                          itemCount: currentRowItem.planets.length,
                          itemBuilder: (context, index) {
                            final planet = currentRowItem.planets[index];
                            return Card(
                              child: SizedBox(
                                width: 250,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: planet.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nPopulation: ${planet.population}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nTerrain: ${planet.terrain}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nClimate: ${planet.climate}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        StarshipsItem() => MovieDetailRow(
                          rowHeight: 250,
                          title: currentRowItem.title,
                          itemCount: currentRowItem.starships.length,
                          itemBuilder: (context, index) {
                            final starship = currentRowItem.starships[index];
                            return Card(
                              child: SizedBox(
                                width: 300,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: starship.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nModel: ${starship.model}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nCapacity: ${starship.cargoCapacity}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nCost: ${starship.costInCredits}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nManufacturer: ${starship.manufacturer}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        VehiclesItem() => MovieDetailRow(
                          rowHeight: 250,
                          title: currentRowItem.title,
                          itemCount: currentRowItem.vehicles.length,
                          itemBuilder: (context, index) {
                            final vehicle = currentRowItem.vehicles[index];
                            return Card(
                              child: SizedBox(
                                width: 300,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: vehicle.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nModel: ${vehicle.model}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nCapacity: ${vehicle.cargoCapacity}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nCost: ${vehicle.costInCredits}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nManufacturer: ${vehicle.manufacturer}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        SpeciesItem() => MovieDetailRow(
                          rowHeight: 200,
                          title: currentRowItem.title,
                          itemCount: currentRowItem.species.length,
                          itemBuilder: (context, index) {
                            final species = currentRowItem.species[index];
                            return Card(
                              child: SizedBox(
                                width: 250,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: RichText(
                                    text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: species.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nLanguage: ${species.language}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                        TextSpan(
                                          text:
                                          '\n\nAverage lifespan: ${species.averageLifespan} years',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall
                                              ?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      };
                    },
                  );
                case Status.error:
                  return Center(child: Text(state.errorMessage));
              }
            },
          ),
        );
      },
    );
  }
}
