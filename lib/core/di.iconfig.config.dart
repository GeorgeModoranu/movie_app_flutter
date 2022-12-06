// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../auth/data/login_API_request.dart' as _i7;
import '../auth/data/login_repository.dart' as _i15;
import '../auth/data/request_token_api.dart' as _i10;
import '../auth/presentation/login_view_model.dart' as _i16;
import '../favorite/data/favorite_movie_dao.dart' as _i5;
import '../favorite/data/favorite_movie_repository.dart' as _i13;
import '../favorite/presentation/favorite_view_model.dart' as _i14;
import '../movie/data/moive_dao.dart' as _i8;
import '../movie/data/movie_api.dart' as _i6;
import '../movie/data/movie_repository.dart' as _i9;
import '../movie/presentation/widgets/movie_details_view_model.dart' as _i17;
import '../movie/presentation/widgets/movies_view_model.dart' as _i18;
import '../user/data/session_token.dart' as _i11;
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
  gh.factory<_i6.IMoviesApi>(() => _i6.MoviesApi(get<_i4.Dio>()));
  gh.lazySingleton<_i7.LoginAPI>(() => _i7.LoginAPI(get<_i4.Dio>()));
  gh.lazySingleton<_i8.MovieDao>(() => _i8.MovieDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i9.MovieRepository>(() => _i9.MovieRepository(
        get<_i6.IMoviesApi>(),
        get<_i8.MovieDao>(),
        get<_i5.FavoriteMoviesDao>(),
      ));
  gh.lazySingleton<_i10.RequestTokenAPI>(
      () => _i10.RequestTokenAPI(get<_i4.Dio>()));
  gh.lazySingleton<_i11.SessionTokenApi>(
      () => _i11.SessionTokenApi(get<_i4.Dio>()));
  await gh.factoryAsync<_i12.SharedPreferences>(
    () => storageModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i13.FavoriteMovieRepository>(
      () => _i13.FavoriteMovieRepository(
            get<_i5.FavoriteMoviesDao>(),
            get<_i8.MovieDao>(),
          ));
  gh.factory<_i14.FavoritesViewModel>(() => _i14.FavoritesViewModel(
        get<_i9.MovieRepository>(),
        get<_i13.FavoriteMovieRepository>(),
      ));
  await gh.singletonAsync<_i15.LoginRepository>(
    () => _i15.LoginRepository.create(
      get<_i7.LoginAPI>(),
      get<_i10.RequestTokenAPI>(),
      get<_i11.SessionTokenApi>(),
      get<_i12.SharedPreferences>(),
    ),
    preResolve: true,
  );
  gh.factory<_i16.LoginViewModel>(
      () => _i16.LoginViewModel(get<_i15.LoginRepository>()));
  gh.factoryParam<_i17.MovieDetailsViewModel, int, dynamic>((
    movieId,
    _,
  ) =>
      _i17.MovieDetailsViewModel(
        get<_i9.MovieRepository>(),
        get<_i13.FavoriteMovieRepository>(),
        movieId,
      ));
  gh.factory<_i18.MoviesViewModel>(() => _i18.MoviesViewModel(
        get<_i9.MovieRepository>(),
        get<_i13.FavoriteMovieRepository>(),
      ));
  return get;
}

class _$StorageModule extends _i19.StorageModule {}

class _$NetworkModule extends _i20.NetworkModule {}
