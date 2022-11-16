import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
      )..interceptors
            .add(InterceptorsWrapper(onRequest: (options, handler) async {
          return handler.next(options
            ..queryParameters = {
              ...options.queryParameters,
              'api_key': _apiKey,
            });
        }));
  static const String _apiKey = '5a478be294eac33de58a26c82fe666ec';
}
