import 'package:flutter/material.dart';
import 'package:flutter_star_wars_project/providers/movie_details_provider.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {

    final detailsProvider = Provider.of<MovieDetailsProvider>(context);
    detailsProvider.loadDetails(refresh: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white10,
        title: Text(detailsProvider.movieTitle),
      ),
      body: ListView.builder(
        padding: EdgeInsetsGeometry.all(10),
        itemCount: detailsProvider.detailItems.length,
        itemBuilder: (context, index) {
          final currentRowItem = detailsProvider.detailItems[index];

          return switch(currentRowItem) {
            CharactersItem() => CharacterRowItem(charactersItem: currentRowItem,),
            PlanetsItem() => PlanetsRowItem(planetsItem: currentRowItem),
            StarshipsItem() => StarshipsRowItem(starshipsItem: currentRowItem,),
            VehiclesItem() => VehiclesRowItem(vehiclesItem: currentRowItem,),
            SpeciesItem() => SpeciesRowItem(speciesItem: currentRowItem,),
          };
        },
      ),
    );
  }
}

class SpeciesRowItem extends StatelessWidget {
  final SpeciesItem speciesItem;
  const SpeciesRowItem({super.key, required this.speciesItem});

  @override
  Widget build(BuildContext context) {
    if (speciesItem.species.isNotEmpty) {
      return Column(
        children: [
          Text(speciesItem.title),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: speciesItem.species.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final species = speciesItem.species[index];
                return Container(
                  width: 100.0, // Adjust width as needed
                  margin: EdgeInsets.all(8.0),
                  color: Colors.blue,
                  child: Center(child: Text(species.name)),
                );
              },
            ),
          ),
        ],
      );;
    } else {
      // Add UI for empty condition
      return Placeholder();
    }
  }
}


class VehiclesRowItem extends StatelessWidget {
  final VehiclesItem vehiclesItem;
  const VehiclesRowItem({super.key, required this.vehiclesItem});

  @override
  Widget build(BuildContext context) {
    if (vehiclesItem.vehicles.isNotEmpty) {
      return Column(
        children: [
          Text(vehiclesItem.title),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: vehiclesItem.vehicles.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final vehicle = vehiclesItem.vehicles[index];
                return Container(
                  width: 100.0, // Adjust width as needed
                  margin: EdgeInsets.all(8.0),
                  color: Colors.blue,
                  child: Center(child: Text(vehicle.name)),
                );
              },
            ),
          ),
        ],
      );;
    } else {
      // Add UI for empty condition
      return Placeholder();
    }
  }
}


class StarshipsRowItem extends StatelessWidget {
  final StarshipsItem starshipsItem;
  const StarshipsRowItem({super.key, required this.starshipsItem});

  @override
  Widget build(BuildContext context) {
    if (starshipsItem.starships.isNotEmpty) {
      return Column(
        children: [
          Text(starshipsItem.title),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: starshipsItem.starships.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final starship = starshipsItem.starships[index];
                return Container(
                  width: 100.0, // Adjust width as needed
                  margin: EdgeInsets.all(8.0),
                  color: Colors.blue,
                  child: Center(child: Text(starship.name)),
                );
              },
            ),
          ),
        ],
      );;
    } else {
      // Add UI for empty condition
      return Placeholder();
    }
  }
}

class PlanetsRowItem extends StatelessWidget {
  final PlanetsItem planetsItem;
  const PlanetsRowItem({
    super.key, required this.planetsItem,
  });

  @override
  Widget build(BuildContext context) {
    if (planetsItem.planets.isNotEmpty) {
      return Column(
        children: [
          Text(planetsItem.title),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: planetsItem.planets.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final planet = planetsItem.planets[index];
                return Container(
                  width: 100.0, // Adjust width as needed
                  margin: EdgeInsets.all(8.0),
                  color: Colors.blue,
                  child: Center(child: Text(planet.name)),
                );
              },
            ),
          ),
        ],
      );;
    } else {
      // Add UI for empty condition
      return Placeholder();
    }
  }
}

class CharacterRowItem extends StatelessWidget {
  final CharactersItem charactersItem;
  const CharacterRowItem({
    super.key, required this.charactersItem,
  });

  @override
  Widget build(BuildContext context) {
    if (charactersItem.characters.isNotEmpty) {
      return Column(
        children: [
          Text(charactersItem.title),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: charactersItem.characters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final character = charactersItem.characters[index];

                return Container(
                  width: 100.0, // Adjust width as needed
                  margin: EdgeInsets.all(8.0),
                  color: Colors.blue,
                  child: Center(child: Text(character.name)),
                );
              },
            ),
          ),
        ],
      );;
    } else {
      // Add UI for empty condition
      return Placeholder();
    }
  }
}
