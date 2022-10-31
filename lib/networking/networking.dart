import 'package:dio/dio.dart';

class NetworkModule {
  NetworkModule() {
    _addInterceptors();
  }
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
  );
  static const String _apiKey = '5a478be294eac33de58a26c82fe666ec';

  void _addInterceptors() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options
        ..queryParameters = {
          ...options.queryParameters,
          'api_key': _apiKey,
        });
    }));
  }
}
