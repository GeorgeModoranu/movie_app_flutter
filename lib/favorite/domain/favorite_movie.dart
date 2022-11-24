import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_movie.freezed.dart';

@freezed
class FavoriteMovie with _$FavoriteMovie {
  factory FavoriteMovie(
      {required int id,
      required String backdropPath,
      required String originalTitle,
      required String posterPath,
      required String title,
      required String overview}) = _FavoriteMovie;
}
