import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/loginRepository/login_API_request.dart';
import 'package:movie_app/loginDate/request_token.dart';
import 'package:movie_app/loginDate/session_load.dart';
import 'package:movie_app/loginDate/session_token.dart';
import 'package:movie_app/loginRepository/login_date_API.dart';
import 'package:movie_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../loginDate/request_token_api.dart';
import '../storage/storage_module.dart';

part 'login_repository.g.dart';

@lazySingleton
class LoginRepository = LoginRepositoryBase with _$LoginRepository;

const String requestToken = 'requestToken';
const String expiresTokenAt = 'expiredTokenAt';
const String sesionToken = 'sesionToken';
const String expireSessionToken = 'expireSessionToken';
const String sessionId = 'sessionId';

abstract class LoginRepositoryBase with Store {
  LoginRepositoryBase(this.loginApi, this.getRequestTokenApi,
      this.newSessionToken, this.sharedPreferences) {
    checkAutentification();
  }

  @observable
  bool isLogin = false;

  final LoginAPI loginApi;
  final RequestTokenAPI getRequestTokenApi;
  final SessionTokenApi newSessionToken;
  final SharedPreferences sharedPreferences;
  //final FlutterSecureStorage secureStorage =StorageModule.getInstance().secureStorage;

  Future<bool> login(String username, String password) async {
    try {
      final RequestToken token = await getRequestTokenApi.getRequestToken();

      await sharedPreferences.setString(requestToken, token.value);
      await sharedPreferences.setString(
          expiresTokenAt, token.expiresAt.toIso8601String());

      final sesionToken = await loginApi.login(LoginDateAPI(
          username: username, password: password, requestToken: token.value));

      final session = await newSessionToken
          .newSession(SessionLoad(requestToken: sesionToken.value));

      await sharedPreferences.setString(sessionId, session.value);

      // await secureStorage.write(key: requestToken, value: token.value);
      // await secureStorage.write(
      //     key: expiresTokenAt, value: token.expiresAt.toIso8601String());
      // await secureStorage.write(key: sessionId, value: session.value);
      checkAutentification();
      return true;
    } catch (ex) {
      return false;
    }
  }

  Future<bool> checkAuth() async {
    final String? token = sharedPreferences.getString(requestToken);
    print(token);
    if (token == null) return false;

    final String? tokenExpiredString =
        sharedPreferences.getString(expiresTokenAt);

    if (tokenExpiredString == null) return false;

    final DateTime tokenExpiredDate = DateTime.parse(tokenExpiredString);
    final DateTime now = DateTime.now().toUtc();

    final Duration diff = tokenExpiredDate.difference(now);
    if (diff.inMilliseconds <= 0) {
      return false;
    }
    return true;
  }

  Future<void> clearExpiredData() async {
    sharedPreferences.remove(requestToken);
    sharedPreferences.remove(expiresTokenAt);
  }

  Future<bool> checkAutentification() async {
    final bool loggin = await checkAuth();
    if (loggin) {
      isLogin = true;
      return true;
    }
    clearExpiredData();
    return false;
  }
}
