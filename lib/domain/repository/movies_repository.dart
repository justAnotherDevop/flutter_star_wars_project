
import '../models/movie_domain.dart';

abstract class MoviesRepository {
  Future<List<MovieDomain>> getMovies();
}
