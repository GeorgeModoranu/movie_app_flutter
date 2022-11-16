import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/storage/di.iconfig.config.dart';
import 'di.iconfig.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async => $initGetIt(getIt);
