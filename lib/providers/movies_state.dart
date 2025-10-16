part of 'movies_cubit.dart';

enum Status {
  initial,
  loading,
  success,
  failure
}

class MoviesState extends Equatable {
  const MoviesState({required this.status, this.movies = const <Movie>[
  ], this.errorMessage = ""});

  final Status status;
  final List<Movie> movies;
  final String errorMessage;

  factory MoviesState.initial() => MoviesState(status: Status.initial);

  @override
  List<Object> get props => [status, movies, errorMessage];

  MoviesState copyWith({
    required Status status,
    List<Movie>? movies,
    String? errorMessage,
  }) {
    return MoviesState(
      status: status,
      movies: movies ?? this.movies,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
