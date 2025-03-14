import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ciland/features/movies/entity/movie.dart';
import 'package:ciland/features/movies/usecase/movies_usecase.dart';
import 'package:equatable/equatable.dart';

part 'movies_state.dart';
part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesUseCase _moviesUseCase;
  MoviesBloc({required MoviesUseCase moviesUseCase})
    : _moviesUseCase = moviesUseCase,
      super(MoviesInProgressInitialState()) {
    on<LoadTopMovies>(_getTopMovies);
    on<LoadMoviesBySearch>(_getMoviesBySearch);
  }

  FutureOr<void> _getTopMovies(
    LoadTopMovies event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      if (state is! MoviesIsLoadedState) emit(MoviesIsLoadingState());
      final result = await _moviesUseCase.getTopMovies(
        movieType: event.movieType,
      );
      emit(MoviesIsLoadedState(movies: result));
    } catch (e) {
      emit(MoviesIsErrorLoadState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }

  FutureOr<void> _getMoviesBySearch(
    LoadMoviesBySearch event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      if (state is! MoviesIsLoadedState) emit(MoviesIsLoadingState());
      final result = await _moviesUseCase.getMoviesBySearch(
        movieType: event.movieType,
        text: event.text,
      );
      emit(MoviesIsLoadedState(movies: result));
    } catch (e) {
      emit(MoviesIsErrorLoadState(exception: e));
    } finally {
      event.completer?.complete();
    }
  }
}
