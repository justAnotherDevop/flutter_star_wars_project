
import 'package:flutter_star_wars_project/domain/models/movie_domain.dart';
import 'package:flutter_star_wars_project/domain/repository/movies_repository.dart';

import '../../data/repository/movies_repository.dart';

class GetMoviesUseCase {
  final MoviesRepository _moviesRepository = MoviesRepositoryImpl.initialise();

  Future<List<MovieDomain>> getMovies() async {
    return await _moviesRepository.getMovies();
  }
}
