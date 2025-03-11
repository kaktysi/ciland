part of 'movies_bloc.dart';

abstract class MoviesEvent {}

class LoadTopMovies extends MoviesEvent{}

class LoadMoviesBySearch extends MoviesEvent{
  final String text;
  final String movieType;

  LoadMoviesBySearch({required this.text, required this.movieType});
}