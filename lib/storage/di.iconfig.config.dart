// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../login/login_view_model.dart' as _i12;
import '../loginDate/request_token_api.dart' as _i8;
import '../loginDate/session_token.dart' as _i9;
import '../loginRepository/login_API_request.dart' as _i5;
import '../loginRepository/login_repository.dart' as _i11;
import '../mobx/movie_api.dart' as _i7;
import '../mobx/movie_repository.dart' as _i13;
import '../movies/moive_dao.dart' as _i6;
import '../networking/networking.dart' as _i16;
import '../presentation/movies_view_model.dart' as _i14;
import 'app_database.dart' as _i3;
import 'storage_module.dart' as _i15; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i5.LoginAPI>(() => _i5.LoginAPI(get<_i4.Dio>()));
  gh.lazySingleton<_i6.MovieDao>(() => _i6.MovieDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i7.MoviesApi>(() => _i7.MoviesApi(get<_i4.Dio>()));
  gh.lazySingleton<_i8.RequestTokenAPI>(
      () => _i8.RequestTokenAPI(get<_i4.Dio>()));
  gh.lazySingleton<_i9.SessionTokenApi>(
      () => _i9.SessionTokenApi(get<_i4.Dio>()));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => storageModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i11.LoginRepository>(() => _i11.LoginRepository(
        get<_i5.LoginAPI>(),
        get<_i8.RequestTokenAPI>(),
        get<_i9.SessionTokenApi>(),
        get<_i10.SharedPreferences>(),
      ));
  gh.factory<_i12.LoginViewModel>(
      () => _i12.LoginViewModel(get<_i11.LoginRepository>()));
  gh.lazySingleton<_i13.MovieRepository>(() => _i13.MovieRepository(
        get<_i7.MoviesApi>(),
        get<_i6.MovieDao>(),
      ));
  gh.factory<_i14.MoviesViewModel>(
      () => _i14.MoviesViewModel(get<_i13.MovieRepository>()));
  return get;
}

class _$StorageModule extends _i15.StorageModule {}

class _$NetworkModule extends _i16.NetworkModule {}
