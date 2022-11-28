import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_movie.freezed.dart';

@freezed
class FavoriteMovie with _$FavoriteMovie {
  factory FavoriteMovie(
      {required int id,
   }) = _FavoriteMovie;
}
