// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_movie.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteMovie {
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteMovieCopyWith<FavoriteMovie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteMovieCopyWith<$Res> {
  factory $FavoriteMovieCopyWith(
          FavoriteMovie value, $Res Function(FavoriteMovie) then) =
      _$FavoriteMovieCopyWithImpl<$Res, FavoriteMovie>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class _$FavoriteMovieCopyWithImpl<$Res, $Val extends FavoriteMovie>
    implements $FavoriteMovieCopyWith<$Res> {
  _$FavoriteMovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavoriteMovieCopyWith<$Res>
    implements $FavoriteMovieCopyWith<$Res> {
  factory _$$_FavoriteMovieCopyWith(
          _$_FavoriteMovie value, $Res Function(_$_FavoriteMovie) then) =
      __$$_FavoriteMovieCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_FavoriteMovieCopyWithImpl<$Res>
    extends _$FavoriteMovieCopyWithImpl<$Res, _$_FavoriteMovie>
    implements _$$_FavoriteMovieCopyWith<$Res> {
  __$$_FavoriteMovieCopyWithImpl(
      _$_FavoriteMovie _value, $Res Function(_$_FavoriteMovie) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_FavoriteMovie(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FavoriteMovie implements _FavoriteMovie {
  _$_FavoriteMovie({required this.id});

  @override
  final int id;

  @override
  String toString() {
    return 'FavoriteMovie(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteMovie &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteMovieCopyWith<_$_FavoriteMovie> get copyWith =>
      __$$_FavoriteMovieCopyWithImpl<_$_FavoriteMovie>(this, _$identity);
}

abstract class _FavoriteMovie implements FavoriteMovie {
  factory _FavoriteMovie({required final int id}) = _$_FavoriteMovie;

  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteMovieCopyWith<_$_FavoriteMovie> get copyWith =>
      throw _privateConstructorUsedError;
}
