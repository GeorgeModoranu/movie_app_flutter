import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/movie/domain/movie.dart';

part 'movie_model.freezed.dart';

@freezed

class MovieModel with _$MovieModel {
  factory MovieModel({
    required Movie movie,
    required bool isFavorite,
  }) = _MovieModel;
}
