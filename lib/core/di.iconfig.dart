import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/di.iconfig.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection({Environment environment = dev}) async =>
    getIt.init(environment: environment.name);
