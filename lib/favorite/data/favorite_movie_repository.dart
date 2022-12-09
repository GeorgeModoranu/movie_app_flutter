import 'package:injectable/injectable.dart';
import 'package:movie_app/favorite/data/favorite_movie_dao.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/data/moive_dao.dart';
import 'package:movie_app/movie/domain/movie.dart';

@lazySingleton
class FavoriteMovieRepository {
  final FavoriteMoviesDao _favoriteMoviesDao;
  final MovieDao dao;
  FavoriteMovieRepository(this._favoriteMoviesDao, this.dao);

  Future<List<Movie>> getFavoriteMovies() {
    return _favoriteMoviesDao.getAllFavoriteMovies();
  }

  Future<void> addMovieToFavorite(int movieId) async {
    final FavoriteMovie favoriteMovie = FavoriteMovie(id: movieId);
    await _favoriteMoviesDao.addFavoriteMovie(favoriteMovie);
  }

  Future<void> removeFavourite(int movieId) async {
    await _favoriteMoviesDao.removeFavoriteMovie(movieId);
  }

  Stream<List<FavoriteMovie>> allFavoriteMovies() {
    return _favoriteMoviesDao.watchAllFavoriteMovies();
  }

  Stream<Set<int>> allFavoriteMoviesId() {
    return _favoriteMoviesDao
        .watchAllFavoriteMovies()
        .map((list) => list.map((e) => e.id).toSet());
  }

  Stream<bool> isFavorite(int movieId) {
    return _favoriteMoviesDao.getFavouriteMovieById(movieId);
  }
}
