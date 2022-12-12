import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  factory Movie(
      {required int id,
      required String backdropPath,
      required String originalTitle,
      required String posterPath,
      required String title,
      required String overview}) = _Movie;

  // @override
  // bool operator ==(Object other) =>
  //     other is Movie &&
  //     other.runtimeType == runtimeType &&
  //     other.id == id &&
  //     other.backdropPath == backdropPath &&
  //     other.originalTitle == originalTitle &&
  //     other.posterPath == posterPath &&
  //     other.title == title &&
  //     other.overview == overview;

  // @override
  // int get hashCode => value.hashCode;
}
