// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestToken _$RequestTokenFromJson(Map<String, dynamic> json) {
  return _RequestToken.fromJson(json);
}

/// @nodoc
mixin _$RequestToken {
  @StringDateTimeConverter()
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'request_token')
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestTokenCopyWith<RequestToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestTokenCopyWith<$Res> {
  factory $RequestTokenCopyWith(
          RequestToken value, $Res Function(RequestToken) then) =
      _$RequestTokenCopyWithImpl<$Res, RequestToken>;
  @useResult
  $Res call(
      {@StringDateTimeConverter()
      @JsonKey(name: 'expires_at')
          DateTime expiresAt,
      @JsonKey(name: 'request_token')
          String value});
}

/// @nodoc
class _$RequestTokenCopyWithImpl<$Res, $Val extends RequestToken>
    implements $RequestTokenCopyWith<$Res> {
  _$RequestTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiresAt = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestTokenCopyWith<$Res>
    implements $RequestTokenCopyWith<$Res> {
  factory _$$_RequestTokenCopyWith(
          _$_RequestToken value, $Res Function(_$_RequestToken) then) =
      __$$_RequestTokenCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@StringDateTimeConverter()
      @JsonKey(name: 'expires_at')
          DateTime expiresAt,
      @JsonKey(name: 'request_token')
          String value});
}

/// @nodoc
class __$$_RequestTokenCopyWithImpl<$Res>
    extends _$RequestTokenCopyWithImpl<$Res, _$_RequestToken>
    implements _$$_RequestTokenCopyWith<$Res> {
  __$$_RequestTokenCopyWithImpl(
      _$_RequestToken _value, $Res Function(_$_RequestToken) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiresAt = null,
    Object? value = null,
  }) {
    return _then(_$_RequestToken(
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestToken implements _RequestToken {
  _$_RequestToken(
      {@StringDateTimeConverter()
      @JsonKey(name: 'expires_at')
          required this.expiresAt,
      @JsonKey(name: 'request_token')
          required this.value});

  factory _$_RequestToken.fromJson(Map<String, dynamic> json) =>
      _$$_RequestTokenFromJson(json);

  @override
  @StringDateTimeConverter()
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;
  @override
  @JsonKey(name: 'request_token')
  final String value;

  @override
  String toString() {
    return 'RequestToken(expiresAt: $expiresAt, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestToken &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expiresAt, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestTokenCopyWith<_$_RequestToken> get copyWith =>
      __$$_RequestTokenCopyWithImpl<_$_RequestToken>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestTokenToJson(
      this,
    );
  }
}

abstract class _RequestToken implements RequestToken {
  factory _RequestToken(
      {@StringDateTimeConverter()
      @JsonKey(name: 'expires_at')
          required final DateTime expiresAt,
      @JsonKey(name: 'request_token')
          required final String value}) = _$_RequestToken;

  factory _RequestToken.fromJson(Map<String, dynamic> json) =
      _$_RequestToken.fromJson;

  @override
  @StringDateTimeConverter()
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt;
  @override
  @JsonKey(name: 'request_token')
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_RequestTokenCopyWith<_$_RequestToken> get copyWith =>
      throw _privateConstructorUsedError;
}
