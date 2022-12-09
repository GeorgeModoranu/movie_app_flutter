// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../auth/data/login_API_request.dart' as _i6;
import '../auth/data/login_repository.dart' as _i14;
import '../auth/data/request_token_api.dart' as _i9;
import '../auth/presentation/login_view_model.dart' as _i15;
import '../favorite/data/favorite_movie_dao.dart' as _i5;
import '../favorite/data/favorite_movie_repository.dart' as _i12;
import '../favorite/presentation/favorite_view_model.dart' as _i13;
import '../movie/data/moive_dao.dart' as _i7;
import '../movie/data/movie_api.dart' as _i8;
import '../movie/data/movie_repository.dart' as _i16;
import '../movie/presentation/widgets/movie_details_view_model.dart' as _i18;
import '../movie/presentation/widgets/movies_view_model.dart' as _i17;
import '../user/data/session_token.dart' as _i10;
import 'network/network_module.dart' as _i20;
import 'storage/app_database.dart' as _i3;
import 'storage/storage_module.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final storageModule = _$StorageModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppDatabase>(() => storageModule.database);
  gh.lazySingleton<_i4.Dio>(() => networkModule.dio);
  gh.lazySingleton<_i5.FavoriteMoviesDao>(
      () => _i5.FavoriteMoviesDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i6.LoginAPI>(() => _i6.LoginAPI(get<_i4.Dio>()));
  gh.lazySingleton<_i7.MovieDao>(() => _i7.MovieDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i8.MoviesApi>(() => _i8.MoviesApi(get<_i4.Dio>()));
  gh.lazySingleton<_i9.RequestTokenAPI>(
      () => _i9.RequestTokenAPI(get<_i4.Dio>()));
  gh.lazySingleton<_i10.SessionTokenApi>(
      () => _i10.SessionTokenApi(get<_i4.Dio>()));
  await gh.factoryAsync<_i11.SharedPreferences>(
    () => storageModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i12.FavoriteMovieRepository>(
      () => _i12.FavoriteMovieRepository(
            get<_i5.FavoriteMoviesDao>(),
            get<_i7.MovieDao>(),
          ));
  gh.factory<_i13.FavoritesViewModel>(
      () => _i13.FavoritesViewModel(get<_i12.FavoriteMovieRepository>()));
  await gh.singletonAsync<_i14.LoginRepository>(
    () => _i14.LoginRepository.create(
      get<_i6.LoginAPI>(),
      get<_i9.RequestTokenAPI>(),
      get<_i10.SessionTokenApi>(),
      get<_i11.SharedPreferences>(),
    ),
    preResolve: true,
  );
  gh.factory<_i15.LoginViewModel>(
      () => _i15.LoginViewModel(get<_i14.LoginRepository>()));
  gh.lazySingleton<_i16.MovieRepository>(() => _i16.MovieRepository(
        get<_i8.MoviesApi>(),
        get<_i7.MovieDao>(),
      ));
  gh.factory<_i17.MoviesViewModel>(() => _i17.MoviesViewModel(
        get<_i16.MovieRepository>(),
        get<_i12.FavoriteMovieRepository>(),
      ));
  gh.factoryParam<_i18.MovieDetailsViewModel, int, dynamic>((
    movieId,
    _,
  ) =>
      _i18.MovieDetailsViewModel(
        get<_i16.MovieRepository>(),
        get<_i12.FavoriteMovieRepository>(),
        movieId,
      ));
  return get;
}

class _$StorageModule extends _i19.StorageModule {}

class _$NetworkModule extends _i20.NetworkModule {}
