import 'package:flutter/material.dart';
import 'package:flutter_star_wars_project/models/film.dart';
import 'package:flutter_star_wars_project/providers/movie_details_provider.dart';
import 'package:flutter_star_wars_project/providers/movies_provider.dart';
import 'package:flutter_star_wars_project/screens/movie_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MoviesProvider()),
        ChangeNotifierProvider(create: (context) => MovieDetailsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Star Wars'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Provider.of<MoviesProvider>(context, listen: false).loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white10,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: EdgeInsetsGeometry.all(10),
        itemCount: moviesProvider.movies.length,
        itemBuilder: (context, index) {
          final movie = moviesProvider.movies[index];
          return MovieCard(movie: movie);
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Film movie;

  @override
  Widget build(BuildContext context) {
    final movieDetailsProvider = Provider.of<MovieDetailsProvider>(context);
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: () =>
        {

          movieDetailsProvider.updateMovieTitle(movie.title),
          movieDetailsProvider.updatePeopleEndpoints(
              peopleEndpoints: movie.characters,
              planetsEndpoints: movie.planets,
              starshipsEndpoints: movie.starships,
              vehicleEndpoints: movie.vehicles,
              speciesEndpoints: movie.species),
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
                    child: Text(movie.director[0]),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    movie.title,
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Icon(Icons.navigate_next),
                ],
              ),
              Text(
                movie.openingCrawl,
                style: Theme
                    .of(context)
                    .textTheme
                    .labelSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
