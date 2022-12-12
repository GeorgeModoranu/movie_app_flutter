import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/favorite/data/favorite_movie_dao.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/data/movie_api.dart';
import 'package:movie_app/movie/data/moive_dao.dart';
import 'package:movie_app/movie/domain/movie.dart';

@lazySingleton
class MovieRepository {
  final MoviesApi _api;
  final MovieDao _dao;

  @observable
  bool isFavorite = false;

  MovieRepository(this._api, this._dao);
  Future<void> loadMovies({int page = 1}) async {
    final List<Movie> result = await _api.getPopularMovies(page: page);
    await _dao.replaceAll(result);
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    return await _api.getTopRatedMovies(page: page);
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    return await _api.getNowPlayingMovies(page: page);
  }

  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    return await _api.getOutInCinema(page: page);
  }

  Stream<List<Movie>> allMovies() {
    return _dao.watchAllMovies();
  }

  Future<Movie> getMovieDetails(int movieId) async {
    final Movie result = await _api.getMovieDetails(movieId);
    return result;
  }
}
