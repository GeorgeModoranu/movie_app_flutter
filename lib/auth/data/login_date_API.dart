import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_date_API.freezed.dart';
part 'login_date_API.g.dart';

@freezed
class LoginDateAPI with _$LoginDateAPI {
  factory LoginDateAPI({
    required String username,
    required String password,
    @JsonKey(name: 'request_token') required String requestToken,
  }) = _LoginDateAPI;

  factory LoginDateAPI.fromJson(Map<String, dynamic> json) =>
      _$LoginDateAPIFromJson(json);
}
