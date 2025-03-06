part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent {}

class LoadMovieDetailsEvent extends MovieDetailsEvent {
  final String id;

  LoadMovieDetailsEvent({required this.id});
}