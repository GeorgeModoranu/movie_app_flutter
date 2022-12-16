import 'package:injectable/injectable.dart';
import 'package:movie_app/core/di.iconfig.config.dart';
import 'package:movie_app/core/di.iconfig.dart';

@injectableInit
Future<void> configureInjectionTestDependencies(
        {Environment environment = test}) async =>
    getIt.init(environment: environment.name);
