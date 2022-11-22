import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/core/network/string_data_time_convertor.dart';

part 'request_token.freezed.dart';
part 'request_token.g.dart';

@freezed
class RequestToken with _$RequestToken {
  factory RequestToken({
    @StringDateTimeConverter()
    @JsonKey(name: 'expires_at')
        required DateTime expiresAt,
    @JsonKey(name: 'request_token') required String value,
  }) = _RequestToken;

  factory RequestToken.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenFromJson(json);
}
