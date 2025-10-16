
import 'package:flutter_star_wars_project/domain/models/movie.dart';
import 'package:flutter_star_wars_project/domain/repository/movies_repository.dart';

import '../data/repository/movies_repository.dart';

class GetMoviesUseCase {
  final MoviesRepository _moviesRepository = MoviesRepositoryImpl.initialise();

  Future<List<Movie>> getMovies() async {
    return await _moviesRepository.getMovies();
  }
}
