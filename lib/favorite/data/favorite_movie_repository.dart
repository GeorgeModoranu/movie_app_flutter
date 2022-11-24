import 'package:injectable/injectable.dart';
import 'package:movie_app/favorite/data/favorite_movie_dao.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/domain/movie.dart';

@lazySingleton
class FavoriteMovieRepository {
  final FavoriteMoviesDao _favoriteMoviesDao;
  FavoriteMovieRepository(this._favoriteMoviesDao);

  void addMovieToFavorite(Movie movie) {
    final FavoriteMovie favoriteMovie = FavoriteMovie(
        id: movie.id,
        backdropPath: movie.backdropPath,
        originalTitle: movie.originalTitle,
        posterPath: movie.posterPath,
        title: movie.title,
        overview: movie.overview);
    _favoriteMoviesDao.addFavoriteMovie(favoriteMovie);
  }

  Stream<List<FavoriteMovie>> allFavoriteMovies() {
    return _favoriteMoviesDao.watchAllFavoriteMovies();
  }
}
