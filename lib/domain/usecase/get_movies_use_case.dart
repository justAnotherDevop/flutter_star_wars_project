import 'package:flutter_star_wars_project/data/repository/movies_repository.dart';
import 'package:flutter_star_wars_project/domain/models/movie_domain.dart';
import 'package:flutter_star_wars_project/domain/repository/movies_repository.dart';
import 'package:flutter_star_wars_project/domain/usecase/base_async_use_case.dart';
import 'package:fpdart/fpdart.dart';

class GetMoviesUseCase extends BaseAsyncUseCase<List<MovieDomain>, Unit> {
  final MoviesRepository _moviesRepository = MoviesRepositoryImpl.initialise();

  @override
  Future<Either<Exception, List<MovieDomain>>> execute(Unit params) async {
    try {
      final result = await _moviesRepository.getMovies();();
      return Right(result);
    } catch (exception) {
      return Left(exception as Exception);
    }
  }
}
