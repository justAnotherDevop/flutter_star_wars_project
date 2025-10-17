import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_star_wars_project/domain/models/movie_domain.dart';
import 'package:flutter_star_wars_project/presentation/bloc/movie_details/movie_details_cubit.dart';
import 'package:flutter_star_wars_project/presentation/screens/movie_details.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final MovieDomain movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () => {
          context.read<MovieDetailsCubit>()
            ..setMovieTitle(movie.title)
            ..updateUrlEndpoints(
              charactersEndpoints: movie.characters,
              planetsEndpoints: movie.planets,
              starshipsEndpoints: movie.starships,
              vehiclesEndpoints: movie.vehicles,
              speciesEndpoints: movie.species,
            ),

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MovieDetails()),
          ),
        },
        child: Container(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey.withAlpha(15),
                    child: Text(
                      movie.director[0],
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        movie.title,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Directed by ${movie.director}",
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.navigate_next),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  movie.openingCrawl,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
