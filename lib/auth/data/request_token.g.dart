// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestToken _$$_RequestTokenFromJson(Map<String, dynamic> json) =>
    _$_RequestToken(
      expiresAt: const StringDateTimeConverter()
          .fromJson(json['expires_at'] as String),
      value: json['request_token'] as String,
    );

Map<String, dynamic> _$$_RequestTokenToJson(_$_RequestToken instance) =>
    <String, dynamic>{
      'expires_at': const StringDateTimeConverter().toJson(instance.expiresAt),
      'request_token': instance.value,
    };
