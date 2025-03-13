import 'package:bloc/bloc.dart';
import 'package:ciland/theme/repository/theme_preferences_repository.dart';

abstract class ThemeEvent {}

class SaveThemeEvent extends ThemeEvent {
  final String theme;

  SaveThemeEvent(this.theme);
}

class LoadThemeEvent extends ThemeEvent {
  final String phoneTheme;

  LoadThemeEvent(this.phoneTheme);
}

class ChangeThemeEvent extends ThemeEvent {
  final String phoneTheme;

  ChangeThemeEvent(this.phoneTheme);
}

class PhoneThemeEvent extends ThemeEvent {
  final String theme;

  PhoneThemeEvent(this.theme);
}

abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class LoadThemeState extends ThemeState {
  final String theme;

  LoadThemeState(this.theme);
}

class ErrorThemeState extends ThemeState {
  final Object? exception;

  ErrorThemeState({required this.exception});
}

class ChangeThemeState extends ThemeState {
  ChangeThemeState();
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemePreferencesRepository _preferencesRepository;

  ThemeBloc({required ThemePreferencesRepository preferencesRepository})
    : _preferencesRepository = preferencesRepository,
      super(ThemeInitial()) {
    on<SaveThemeEvent>(_onSaveThemeEvent);
    on<LoadThemeEvent>(_onLoadThemeEvent);
    on<ChangeThemeEvent>(_onChangeThemeEvent);
  }

  Future<void> _onSaveThemeEvent(
    SaveThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      await _preferencesRepository.saveAppTheme(event.theme);
      emit(LoadThemeState(event.theme));
    } catch (e) {
      emit(ErrorThemeState(exception: e));
    }
  }

  Future<void> _onLoadThemeEvent(
    LoadThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      String themePref = await _preferencesRepository.getAppTheme();
      String themePhone = event.phoneTheme;
      if (themePref == 'no_theme_saved') {
        emit(LoadThemeState(themePhone));
        await _preferencesRepository.saveAppTheme(themePhone);
      } else {
        emit(LoadThemeState(themePref));
      }
    } catch (e) {
      emit(ErrorThemeState(exception: e));
    }
  }

  Future<void> _onChangeThemeEvent(
    ChangeThemeEvent event,
    Emitter<ThemeState> emit,
  ) async {
    emit(ChangeThemeState());
    try {
      await _preferencesRepository.saveAppTheme(event.phoneTheme);
    } catch (e) {
      emit(ErrorThemeState(exception: e));
    }
  }
}
