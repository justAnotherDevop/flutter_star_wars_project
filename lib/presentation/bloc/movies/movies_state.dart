part of 'movies_cubit.dart';

enum MovieStatus {
  initial,
  loading,
  success,
  failure
}

class MoviesState extends Equatable {
  const MoviesState({required this.status, this.movies = const <MovieDomain>[
  ], this.errorMessage = ""});

  final MovieStatus status;
  final List<MovieDomain> movies;
  final String errorMessage;

  factory MoviesState.initial() => MoviesState(status: MovieStatus.initial);

  @override
  List<Object> get props => [status, movies, errorMessage];

  MoviesState copyWith({
    required MovieStatus status,
    List<MovieDomain>? movies,
    String? errorMessage,
  }) {
    return MoviesState(
      status: status,
      movies: movies ?? this.movies,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
