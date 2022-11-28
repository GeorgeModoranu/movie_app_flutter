import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/movie/domain/movie.dart';

class MovieModel {
  final Movie movie;
  final bool isFavorite;
  MovieModel(this.movie, this.isFavorite);

  
}
