import 'package:flutter/material.dart';
import 'package:flutter_star_wars_project/data/repository/movies_repository.dart';
import 'package:flutter_star_wars_project/models/film.dart';

class MoviesProvider with ChangeNotifier {

  List<Film> _movies = [];

  Future<void> loadMovies() async {
    final moviesRepo = MoviesRepository.initialise();
    final result = await moviesRepo.getMovies();
    _movies = result?.films ?? [];

    notifyListeners();
  }

  List<Film> get movies => _movies;
}
