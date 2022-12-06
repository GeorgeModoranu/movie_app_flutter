import 'dart:ffi';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/storage/app_database.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/domain/movie.dart';

export 'package:movie_app/favorite/data/favorite_movie_tabel.dart';

@lazySingleton
class FavoriteMoviesDao {
  final AppDatabase _db;
  FavoriteMoviesDao(this._db);

  Stream<List<FavoriteMovie>> watchAllFavoriteMovies() {
    return _db.select(_db.favoriteMoviesTable).watch();
  }

  Future<List<Movie>> getAllFavoriteMovies() {
    final query = _db.select(_db.favoriteMoviesTable).join([
      innerJoin(_db.movieTable,
          _db.movieTable.id.equalsExp(_db.favoriteMoviesTable.id))
    ]).map((row) => row.readTable(_db.movieTable));
    return query.get();
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
