// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_app/auth/data/login_API_request.dart' as _i7;
import 'package:movie_app/auth/data/login_repository.dart' as _i16;
import 'package:movie_app/auth/data/request_token_api.dart' as _i11;
import 'package:movie_app/auth/presentation/login_view_model.dart' as _i17;
import 'package:movie_app/core/network/network_module.dart' as _i21;
import 'package:movie_app/core/storage/app_database.dart' as _i3;
import 'package:movie_app/core/storage/fake_storage_module.dart' as _i4;
import 'package:movie_app/core/storage/storage_module.dart' as _i22;
import 'package:movie_app/favorite/data/favorite_movie_dao.dart' as _i6;
import 'package:movie_app/favorite/data/favorite_movie_repository.dart' as _i14;
import 'package:movie_app/favorite/presentation/favorite_view_model.dart'
    as _i15;
import 'package:movie_app/movie/data/fake_movie_api.dart' as _i10;
import 'package:movie_app/movie/data/moive_dao.dart' as _i8;
import 'package:movie_app/movie/data/movie_api.dart' as _i9;
import 'package:movie_app/movie/data/movie_repository.dart' as _i18;
import 'package:movie_app/movie/presentation/widgets/movie_details_view_model.dart'
    as _i20;
import 'package:movie_app/movie/presentation/widgets/movies_view_model.dart'
    as _i19;
import 'package:movie_app/user/data/session_token.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

const String _dev = 'dev';
const String _test = 'test';

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final fakeStorageModule = _$FakeStorageModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i3.AppDatabase>(
      () => storageModule.database,
      registerFor: {_dev},
    );
    gh.lazySingleton<_i3.AppDatabase>(
      () => fakeStorageModule.database,
      registerFor: {_test},
      dispose: _i4.disposeDatabase,
    );
    gh.lazySingleton<_i5.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i6.FavoriteMoviesDao>(
        () => _i6.FavoriteMoviesDao(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i7.LoginAPI>(() => _i7.LoginAPI(gh<_i5.Dio>()));
    gh.lazySingleton<_i8.MovieDao>(() => _i8.MovieDao(gh<_i3.AppDatabase>()));
    gh.lazySingleton<_i9.MoviesApi>(
      () => _i9.MoviesApi(gh<_i5.Dio>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i9.MoviesApi>(
      () => _i10.FakeMoviesApi(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i11.RequestTokenAPI>(
        () => _i11.RequestTokenAPI(gh<_i5.Dio>()));
    gh.lazySingleton<_i12.SessionTokenApi>(
        () => _i12.SessionTokenApi(gh<_i5.Dio>()));
    await gh.factoryAsync<_i13.SharedPreferences>(
      () => storageModule.sharedPreferences,
      registerFor: {_dev},
      preResolve: true,
    );
    await gh.factoryAsync<_i13.SharedPreferences>(
      () => fakeStorageModule.sharedPreferences,
      registerFor: {_test},
      preResolve: true,
    );
    gh.lazySingleton<_i14.FavoriteMovieRepository>(
        () => _i14.FavoriteMovieRepository(
              gh<_i6.FavoriteMoviesDao>(),
              gh<_i8.MovieDao>(),
            ));
    gh.factory<_i15.FavoritesViewModel>(
        () => _i15.FavoritesViewModel(gh<_i14.FavoriteMovieRepository>()));
    await gh.singletonAsync<_i16.LoginRepository>(
      () => _i16.LoginRepository.create(
        gh<_i7.LoginAPI>(),
        gh<_i11.RequestTokenAPI>(),
        gh<_i12.SessionTokenApi>(),
        gh<_i13.SharedPreferences>(),
      ),
      preResolve: true,
    );
    gh.factory<_i17.LoginViewModel>(
        () => _i17.LoginViewModel(gh<_i16.LoginRepository>()));
    gh.lazySingleton<_i18.MovieRepository>(() => _i18.MovieRepository(
          gh<_i9.MoviesApi>(),
          gh<_i8.MovieDao>(),
        ));
    gh.factory<_i19.MoviesViewModel>(() => _i19.MoviesViewModel(
          gh<_i18.MovieRepository>(),
          gh<_i14.FavoriteMovieRepository>(),
        ));
    gh.factoryParam<_i20.MovieDetailsViewModel, int, dynamic>((
      movieId,
      _,
    ) =>
        _i20.MovieDetailsViewModel(
          gh<_i18.MovieRepository>(),
          gh<_i14.FavoriteMovieRepository>(),
          movieId,
        ));
    return this;
  }
}

class _$NetworkModule extends _i21.NetworkModule {}

class _$StorageModule extends _i22.StorageModule {}

class _$FakeStorageModule extends _i4.FakeStorageModule {}
