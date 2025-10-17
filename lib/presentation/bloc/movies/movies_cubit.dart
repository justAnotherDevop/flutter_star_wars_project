import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_star_wars_project/domain/models/movie_domain.dart';
import 'package:flutter_star_wars_project/domain/usecase/get_movies_use_case.dart';
import 'package:fpdart/fpdart.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesState.initial());

  final _getMoviesUseCase = GetMoviesUseCase();

  Future<void> loadMovies() async {
    emit(state.copyWith(status: MovieStatus.loading));
    final movies = await _getMoviesUseCase.execute(unit);
    movies.fold(
      (error) => emit(
        state.copyWith(
          status: MovieStatus.failure,
          errorMessage: error.toString(),
        ),
      ),
      (result) {
        emit(state.copyWith(status: MovieStatus.success, movies: result));
      },
    );
  }
}
