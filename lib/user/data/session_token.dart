import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/user/data/session_load.dart';
import 'package:movie_app/user/data/session_request.dart';

@lazySingleton
class SessionTokenApi {
  final Dio dio;
  SessionTokenApi(this.dio);

  Future<SessionReqeust> newSession(final SessionLoad load) async {
    try {
      final response =
          await dio.post('/authentication/session/new', data: load.toJson());
      return SessionReqeust.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
