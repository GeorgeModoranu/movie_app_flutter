import 'dart:async';

import 'package:movie_app/movie/data/moive_dao.dart';
import 'package:movie_app/movie/domain/movie.dart';

import '../../common.dart';

class FakeMovieDao implements MovieDao {
  StreamController<List<Movie>> movieStream = StreamController();
  List<Movie> _movies = [];
  @override
  Future<void> deleteAllMovies() {
    return asyncValue(
      (_) => {_movies = [], movieStream.add(_movies)},
    );
  }

  @override
  Future<List<Movie>> getAllMovies() {
    return asyncValue((_) => _movies);
  }

  @override
  Future<void> replaceAll(List<Movie> movies) {
    return asyncValue(
      (_) => {_movies = movies, movieStream.add(_movies)},
    );
  }

  @override
  Future<void> upsertMovies(List<Movie> movies) {
    return asyncValue(
      (_) => {_movies = movies, movieStream.add(_movies)},
    );
  }

  @override
  Stream<List<Movie>> watchAllMovies() {
    return movieStream.stream;
  }
}
