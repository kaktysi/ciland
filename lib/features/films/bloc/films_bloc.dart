import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ciland/features/films/entity/film.dart';
import 'package:ciland/features/films/usecase/films_usecase.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final FilmsUseCase _filmsUseCase;
  FilmsBloc({required FilmsUseCase filmsUseCase})
    : _filmsUseCase = filmsUseCase,
      super(FilmsInProgressInitialState()) {
    on<LoadTopFilms>(_getTopFilms);
  }

  FutureOr<void> _getTopFilms(
    LoadTopFilms event,
    Emitter<FilmsState> emit,
  ) async {
    try {
      emit(FilmsIsLoadingState());
      final result = await _filmsUseCase.getTopFilms();
      emit(FilmsIsLoadedState(films: result));
    } catch (e) {
      emit(FilmsIsErrorLoadState(exception: e));
    }
  }
}
