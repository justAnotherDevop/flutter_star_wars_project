import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_star_wars_project/presentation/widgets/movie_detail_row.dart';
import '../bloc/movie_details_cubit.dart';

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
                            return Card(
                              child: SizedBox(
                                width: 150,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Text(character.name),
                                ),
                              ),
                            );
                          },
                        ),
                        PlanetsItem() => MovieDetailRow(
                          title: currentRowItem.title,
                          itemCount: currentRowItem.planets.length,
                          itemBuilder: (context, index) {
                            final planet = currentRowItem.planets[index];
                            return Card(
                              child: SizedBox(
                                width: 150,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Text(planet.name),
                                ),
                              ),
                            );
                          },
                        ),
                        StarshipsItem() => MovieDetailRow(
                          title: currentRowItem.title,
                          itemCount: currentRowItem.starships.length,
                          itemBuilder: (context, index) {
                            final starship = currentRowItem.starships[index];
                            return Card(
                              child: SizedBox(
                                width: 150,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Text(starship.name),
                                ),
                              ),
                            );
                          },
                        ),
                        VehiclesItem() => MovieDetailRow(
                          title: currentRowItem.title,
                          itemCount: currentRowItem.vehicles.length,
                          itemBuilder: (context, index) {
                            final vehicle = currentRowItem.vehicles[index];
                            return Card(
                              child: SizedBox(
                                width: 150,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Text(vehicle.name),
                                ),
                              ),
                            );
                          },
                        ),
                        SpeciesItem() => MovieDetailRow(
                          title: currentRowItem.title,
                          itemCount: currentRowItem.species.length,
                          itemBuilder: (context, index) {
                            final species = currentRowItem.species[index];
                            return Card(
                              child: SizedBox(
                                width: 150,
                                child: ListTile(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  title: Text(species.name),
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
