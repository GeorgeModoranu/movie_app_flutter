import 'package:injectable/injectable.dart';
import 'package:movie_app/favorite/data/favorite_movie_dao.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/domain/movie.dart';

@lazySingleton
class FavoriteMovieRepository {
  final FavoriteMoviesDao _favoriteMoviesDao;
  FavoriteMovieRepository(this._favoriteMoviesDao);

  Future<void> addMovieToFavorite(int movieId) async {
    final FavoriteMovie favoriteMovie = FavoriteMovie(id: movieId);
    await _favoriteMoviesDao.addFavoriteMovie(favoriteMovie);
  }

  Future<void> removeFavourite(int movieId) async {
    await _favoriteMoviesDao.removeFavoriteMovie(movieId);
  }

  Stream<Set<int>> allFavoriteMovies() {
    return _favoriteMoviesDao
        .watchAllFavoriteMovies()
        .map((list) => list.map((e) => e.id).toSet());
  }

  Stream<bool> isFavorite(int movieId) {
    return _favoriteMoviesDao.getFavouriteMovieById(movieId);
  }
}
