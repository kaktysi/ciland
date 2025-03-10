import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ciland/features/movies/entity/film.dart';
import 'package:ciland/features/movies/usecase/movies_usecase.dart';

part 'movies_state.dart';
part 'movies_event.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesUseCase _moviesUseCase;
  MoviesBloc({required MoviesUseCase moviesUseCase})
    : _moviesUseCase = moviesUseCase,
      super(MoviesInProgressInitialState()) {
    on<LoadTopMovies>(_getTopMovies);
  }

  FutureOr<void> _getTopMovies(
    LoadTopMovies event,
    Emitter<MoviesState> emit,
  ) async {
    try {
      emit(MoviesIsLoadingState());
      final result = await _moviesUseCase.getTopMovies();
      emit(MoviesIsLoadedState(movies: result));
    } catch (e) {
      emit(MoviesIsErrorLoadState(exception: e));
    }
  }
}
