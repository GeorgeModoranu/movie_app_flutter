import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:movie_app/core/storage/app_database.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';

export 'package:movie_app/favorite/data/favorite_movie_tabel.dart';

@lazySingleton
class FavoriteMoviesDao {
  final AppDatabase _db;
  FavoriteMoviesDao(this._db);

  Stream<List<FavoriteMovie>> watchAllFavoriteMovies() {
    return _db.select(_db.favoriteMoviesTable).watch();
  }

  Future<List<FavoriteMovie>> getAllFavoriteMovies() {
    return _db.select(_db.favoriteMoviesTable).get();
  }

  Future<void> deleteAllFavoriteMovies() {
    return _db.transaction(() async {
      await _db.delete(_db.favoriteMoviesTable).go();
    });
  }

  Future<void> addFavoriteMovie(final FavoriteMovie movie) async {
    await _db
        .into(_db.favoriteMoviesTable)
        .insertOnConflictUpdate(movie.toInsertable());
  }

  Future<void> removeFavoriteMovie(final int movieId) {
    return (_db.delete(_db.favoriteMoviesTable)
          ..where((t) => t.id.equals(movieId)))
        .go();
  }

  Stream<bool> getFavouriteMovieById(int movieId) {
    return (_db.select(_db.favoriteMoviesTable)
          ..where((tbl) => tbl.id.equals(movieId)))
        .watchSingleOrNull()
        .map((event) => event != null);
  }
}
