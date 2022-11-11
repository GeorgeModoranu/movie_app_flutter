import 'package:dio/dio.dart';
import 'package:movie_app/loginDate/session_load.dart';
import 'package:movie_app/loginDate/session_request.dart';
import 'package:movie_app/networking/networking.dart';

class SessionTokenApi {
  final NetworkModule networkModule = NetworkModule();

  Future<SessionReqeust> newSession(final SessionLoad load) async {
    try {
      final response = await networkModule.dio
          .post('/authentication/session/new', data: load.toJson());
      return SessionReqeust.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
