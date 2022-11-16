import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/loginDate/request_token.dart';
import 'package:movie_app/networking/networking.dart';

@lazySingleton
class RequestTokenAPI {
  final Dio dio;
  RequestTokenAPI(this.dio);

  Future<RequestToken> getRequestToken() async {
    try {
      final response = await dio.get('/authentication/token/new');
      return RequestToken.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
