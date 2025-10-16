import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_star_wars_project/domain/get_movies_use_case.dart';

import '../domain/models/movie.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesState.initial());

  final _getMoviesUseCase = GetMoviesUseCase();

  Future<void> loadMovies() async {
    try {
      emit(state.copyWith(status: Status.loading));
      final result = await _getMoviesUseCase.getMovies();
      emit(state.copyWith(status: Status.success, movies: result));
    } catch (exception, _) {
      emit(state.copyWith(
          status: Status.failure, errorMessage: exception.toString()));
    }
  }
}
