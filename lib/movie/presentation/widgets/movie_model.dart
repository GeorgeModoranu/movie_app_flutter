import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/movie/domain/movie.dart';

class MovieModel {
  final Movie movie;
  final bool isFavorite;
  MovieModel(this.movie, this.isFavorite);
  @override
  bool operator ==(Object other) =>
      other is MovieModel &&
      other.runtimeType == runtimeType &&
      other.movie == movie &&
      other.isFavorite == isFavorite;

  @override
  int get hashCode => movie.id.hashCode;

  // @override
  // String toString() {
  //   return '''MovieModel(
  //       Movie(
  //           id: ${movie.id},
  //           backdropPath: '${movie.backdropPath}',
  //           originalTitle: '${movie.originalTitle}',
  //           posterPath: '${movie.posterPath}',
  //           title: '${movie.title}',
  //           overview: '${movie.overview}'),
  //       isFavorite = ${isFavorite})''';
  // }

}
