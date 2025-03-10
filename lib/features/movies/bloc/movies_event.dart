part of 'movies_bloc.dart';

abstract class MoviesEvent {}

class LoadTrendingDayMovies extends MoviesEvent{}

class LoadTrendingWeekMovies extends MoviesEvent{}

class LoadTopMovies extends MoviesEvent{}