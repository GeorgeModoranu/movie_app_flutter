import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/auth/data/login_API_request.dart';
import 'package:movie_app/auth/data/login_date_API.dart';
import 'package:movie_app/auth/data/request_token.dart';
import 'package:movie_app/auth/data/request_token_api.dart';
import 'package:movie_app/user/data/session_load.dart';
import 'package:movie_app/user/data/session_token.dart';

import 'package:shared_preferences/shared_preferences.dart';

part 'login_repository.g.dart';

@singleton
@preResolve
class LoginRepository extends LoginRepositoryBase with _$LoginRepository {
  LoginRepository._(
    LoginAPI loginApi,
    RequestTokenAPI requestTokenApi,
    SessionTokenApi sessionTokenApi,
    SharedPreferences sharedPreferences,
  ) : super(
          loginApi,
          requestTokenApi,
          sessionTokenApi,
          sharedPreferences,
        );
  @factoryMethod
  static Future<LoginRepository> create(
    LoginAPI loginApi,
    RequestTokenAPI getRequestTokenApi,
    SessionTokenApi sessionTokenApi,
    SharedPreferences sharedPreferences,
  ) async {
    final loginRepository = LoginRepository._(
      loginApi,
      getRequestTokenApi,
      sessionTokenApi,
      sharedPreferences,
    );
    await loginRepository.checkAutentification();
    return loginRepository;
  }
}

const String requestToken = 'requestToken';
const String expiresTokenAt = 'expiredTokenAt';
const String sesionToken = 'sesionToken';
const String expireSessionToken = 'expireSessionToken';
const String sessionId = 'sessionId';

abstract class LoginRepositoryBase with Store {
  LoginRepositoryBase(this.loginApi, this.getRequestTokenApi,
      this.newSessionToken, this.sharedPreferences) {}

  @observable
  bool isLogin = false;

  final LoginAPI loginApi;
  final RequestTokenAPI getRequestTokenApi;
  final SessionTokenApi newSessionToken;
  final SharedPreferences sharedPreferences;

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

  Future<void> clearToken() async {
    sharedPreferences.remove(requestToken);
    sharedPreferences.remove(expiresTokenAt);
  }

  Future<void> checkAutentification() async {
    final bool hasToken = await checkAuth();
    if (hasToken) {
      isLogin = true;
    }
    isLogin = false;
    clearToken();
  }
}
