import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:movie_app/core/storage/app_database.dart';
import 'package:movie_app/movie/domain/movie.dart';

export 'package:movie_app/movie/data/movie_table.dart';

@lazySingleton
class MovieDao {
  final AppDatabase _db;
  MovieDao(this._db);

  Stream<List<Movie>> watchAllMovies() {
    return _db.select(_db.movieTable).watch();
  }

  // Stream<List<Movie>> watchAllFavoriteMovies() {
  //   return _db.select(_db.favoriteMoviesTable).watch();
  // }
  Future<List<Movie>> getAllMovies() {
    return _db.select(_db.movieTable).get();
  }

  Future<void> replaceAll(final List<Movie> movies) async {
    await deleteAllMovies();
    await upsertMovies(movies);
  }

  Future<void> deleteAllMovies() {
    return _db.transaction(() async {
      await _db.delete(_db.movieTable).go();
    });
  }

  // Future<void> upsertMovies(final List<Movie> movies) async {
  //   for (final movie in movies) {
  //     await _db
  //         .into(_db.movieTable)
  //         .insertOnConflictUpdate(movie.toInsertable());
  //   }
  // }

  Future<void> upsertMovies(final List<Movie> movies) async {
    await _db.batch((batch) {
      // functions in a batch don't have to be awaited - just
      // await the whole batch afterwards.
      batch.insertAllOnConflictUpdate(
          _db.movieTable, movies.map((e) => e.toInsertable()));
    });
  }
}
