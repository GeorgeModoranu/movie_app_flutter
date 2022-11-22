import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/data/movie_api.dart';
import 'package:movie_app/movie/data/moive_dao.dart';
import 'package:movie_app/movie/domain/movie.dart';

@lazySingleton
class MovieRepository {
  final MoviesApi api;
  final MovieDao _dao;
  MovieRepository(this.api, this._dao);
  Future<void> loadMovies({int page = 1}) async {
    final List<Movie> result = await api.getPopularMovies(page: page);
    await _dao.replaceAll(result);
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    return await api.getTopRatedMovies(page: page);
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    return await api.getNowPlayingMovies(page: page);
  }

  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    return await api.getOutInCinema(page: page);
  }

  Stream<List<Movie>> allMovies() {
    return _dao.watchAllMovies();
  }

  Future<Movie> getMovieDetails(int movieId) async {
    final Movie result = await api.getMovieDetails(movieId);
    return result;
  }
  

}
