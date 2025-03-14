part of 'movies_bloc.dart';

abstract class MoviesState extends Equatable {}

class MoviesInProgressInitialState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MoviesIsLoadingState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MoviesIsLoadedState extends MoviesState {
  MoviesIsLoadedState({required this.movies});

  final List<Movie> movies;

  @override
  List<Object?> get props => [movies];
}

class MoviesIsErrorLoadState extends MoviesState {
  MoviesIsErrorLoadState({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
