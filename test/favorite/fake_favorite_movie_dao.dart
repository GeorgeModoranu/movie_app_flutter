import 'dart:async';

import 'package:movie_app/favorite/data/favorite_movie_dao.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';

class FakeFavoriteMovieDao implements FavoriteMoviesDao {
  StreamController<List<FavoriteMovie>> favoirteMoviesIdStream =
      StreamController();

  @override
  Future<void> addFavoriteMovie(FavoriteMovie movie) {
    // TODO: implement addFavoriteMovie
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllFavoriteMovies() {
    // TODO: implement deleteAllFavoriteMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getAllFavoriteMovies() {
    // TODO: implement getAllFavoriteMovies
    throw UnimplementedError();
  }

  @override
  Stream<bool> getFavouriteMovieById(int movieId) {
    // TODO: implement getAllFavoriteMovies
    throw UnimplementedError();
  }

  @override
  Future<void> removeFavoriteMovie(int movieId) {
    // TODO: implement removeFavoriteMovie
    throw UnimplementedError();
  }

  @override
  Stream<List<FavoriteMovie>> watchAllFavoriteMovies() {
    favoirteMoviesIdStream.add([]);
    return favoirteMoviesIdStream.stream;
  }
}
