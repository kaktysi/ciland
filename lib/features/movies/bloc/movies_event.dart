part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {}

class LoadTopMovies extends MoviesEvent {
  final String movieType;
  final Completer? completer;

  LoadTopMovies({required this.movieType, this.completer});

  @override
  List<Object?> get props => [movieType, completer];
}

class LoadMoviesBySearch extends MoviesEvent {
  final String text;
  final String movieType;
  final Completer? completer;

  LoadMoviesBySearch({
    required this.text,
    required this.movieType,
    this.completer,
  });

  @override
  List<Object?> get props => [text, movieType, completer];
}
