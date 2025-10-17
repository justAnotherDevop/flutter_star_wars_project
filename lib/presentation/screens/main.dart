import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_star_wars_project/presentation/bloc/movie_details/movie_details_cubit.dart';
import 'package:flutter_star_wars_project/presentation/bloc/movies/movies_cubit.dart';
import 'package:flutter_star_wars_project/presentation/widgets/movie_card.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MoviesCubit>(create: (context) => MoviesCubit()),
        BlocProvider<MovieDetailsCubit>(
          create: (context) => MovieDetailsCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
    context.read<MoviesCubit>().loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white10,
            title: Text(widget.title),
          ),
          body: Builder(
            builder: (_) {
              switch (state.status) {
                case MovieStatus.initial:
                case MovieStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case MovieStatus.success:
                  return RefreshIndicator(
                    onRefresh: () async {
                      context.read<MoviesCubit>().loadMovies();
                    },
                    child: ListView.builder(
                      padding: EdgeInsetsGeometry.all(10),
                      itemCount: state.movies.length,
                      itemBuilder: (context, index) {
                        final movie = state.movies[index];
                        return MovieCard(movie: movie);
                      },
                    ),
                  );
                case MovieStatus.failure:
                  return Center(child: Text(state.errorMessage));
              }
            },
          ),
        );
      },
    );
  }
}


