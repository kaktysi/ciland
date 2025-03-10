part of 'movies_bloc.dart';

abstract class MoviesState {}

class MoviesInProgressInitialState extends MoviesState {}

class MoviesIsLoadingState extends MoviesState {}

class MoviesIsLoadedState extends MoviesState {
  MoviesIsLoadedState({required this.movies});

  final List<Movie> movies;
}

class MoviesIsErrorLoadState extends MoviesState {
  MoviesIsErrorLoadState({required this.exception});

  final Object? exception;
}
