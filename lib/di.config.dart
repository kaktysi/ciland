// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ciland/features/movie_details/repository/imdb_movie_details_repository.dart'
    as _i954;
import 'package:ciland/features/movie_details/repository/movie_details_repository.dart'
    as _i949;
import 'package:ciland/features/movie_details/usecase/movie_details_usecase.dart'
    as _i444;
import 'package:ciland/features/movies/repository/abstract_films_repository.dart'
    as _i287;
import 'package:ciland/features/movies/repository/imdb_repository.dart' as _i16;
import 'package:ciland/features/movies/usecase/movies_usecase.dart' as _i560;
import 'package:ciland/repositories/noticification_repository/abstract_noticification_repository.dart'
    as _i979;
import 'package:ciland/repositories/noticification_repository/firebase_noticification_repository.dart'
    as _i680;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i287.AbstractMoviesRepository>(
      () => _i16.IMDBRepository(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i949.AbstractMovieDetailsRepository>(
      () => _i954.ImdbMovieDetailsRepository(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i979.AbstractNotificationRepository>(
      () => _i680.FirebaseNotificationRepository(),
    );
    gh.lazySingleton<_i560.MoviesUseCase>(
      () => _i560.MoviesUseCase(gh<_i287.AbstractMoviesRepository>()),
    );
    gh.lazySingleton<_i444.MovieDetailsUseCase>(
      () =>
          _i444.MovieDetailsUseCase(gh<_i949.AbstractMovieDetailsRepository>()),
    );
    return this;
  }
}
