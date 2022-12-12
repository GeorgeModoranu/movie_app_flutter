import 'package:injectable/injectable.dart';
import 'package:movie_app/core/storage/app_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
@dev
abstract class StorageModule {
  @lazySingleton
  @dev
  AppDatabase get database => AppDatabase();
  @preResolve
  @dev
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
