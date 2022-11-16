import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/loginDate/request_token.dart';
import 'package:movie_app/loginRepository/login_date_API.dart';
import 'package:movie_app/networking/networking.dart';

@lazySingleton
class LoginAPI {
  final Dio dio;
  LoginAPI(this.dio);
  Future<RequestToken> login(final LoginDateAPI payload) async {
    try {
      final response = await dio.post(
          '/authentication/token/validate_with_login',
          data: payload.toJson());
      return RequestToken.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
