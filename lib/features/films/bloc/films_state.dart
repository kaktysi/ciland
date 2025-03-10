part of 'films_bloc.dart';

abstract class FilmsState {}

class FilmsInProgressInitialState extends FilmsState {}

class FilmsIsLoadingState extends FilmsState {}

class FilmsIsLoadedState extends FilmsState {
  FilmsIsLoadedState({required this.films});

  final List<Movie> films;
}

class FilmsIsErrorLoadState extends FilmsState {
  FilmsIsErrorLoadState({required this.exception});

  final Object? exception;
}
