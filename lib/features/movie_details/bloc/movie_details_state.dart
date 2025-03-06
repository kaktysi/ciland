part of 'movie_details_bloc.dart';


abstract class MovieDetailsState {}

class MovieDetailsIInitialState extends MovieDetailsState {}

class MovieDetailsIsLoadingState extends MovieDetailsState {}

class MovieDetailsIsLoadedState extends MovieDetailsState {
  MovieDetailsIsLoadedState({required this.movieDetails});

  final MovieDetails movieDetails;
}

class MovieDetailsIsErrorLoadState extends MovieDetailsState {
  MovieDetailsIsErrorLoadState({required this.exception});

  final Object? exception;
}
