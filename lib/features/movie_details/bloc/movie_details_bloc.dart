import 'dart:async';

import 'package:ciland/features/movie_details/entity/movie_details.dart';
import 'package:ciland/features/movie_details/usecase/movie_details_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsUseCase _movieDetailsUseCase;
  MovieDetailsBloc({required MovieDetailsUseCase movieDetailsUseCase})
    : _movieDetailsUseCase = movieDetailsUseCase,
      super(MovieDetailsIInitialState()) {
    on<LoadMovieDetailsEvent>(_getMovieDetails);
  }

  FutureOr<void> _getMovieDetails(LoadMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
        try {
      emit(MovieDetailsIsLoadingState());
      final result = await _movieDetailsUseCase.getMovieDetails(event.id);
      emit(MovieDetailsIsLoadedState(movieDetails: result));
    } catch (e) {
      emit(MovieDetailsIsErrorLoadState(exception: e));
    }
  }
}