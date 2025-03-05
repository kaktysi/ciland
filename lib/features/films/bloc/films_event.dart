part of 'films_bloc.dart';

abstract class FilmsEvent {}

class LoadTrendingDayFilms extends FilmsEvent{}

class LoadTrendingWeekFilms extends FilmsEvent{}

class LoadTopFilms extends FilmsEvent{}