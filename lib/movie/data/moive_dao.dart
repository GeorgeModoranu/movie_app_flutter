import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:movie_app/core/storage/app_database.dart';
import 'package:movie_app/movie/domain/movie.dart';

export 'package:movie_app/movie/data/movie_tables.dart';

@lazySingleton
class MovieDao {
  final AppDatabase _db;
  MovieDao(this._db);

  Stream<List<Movie>> watchAllMovies() {
    return _db.select(_db.movieTables).watch();
  }

  Future<List<Movie>> getAllMovies() {
    return _db.select(_db.movieTables).get();
  }

  Future<void> replaceAll(final List<Movie> movies) async {
    await deleteAllMovies();
    await upsertMovies(movies);
  }

  Future<void> deleteAllMovies() {
    return _db.transaction(() async {
      await _db.delete(_db.movieTables).go();
    });
  }

  Future<void> upsertMovies(final List<Movie> movies) async {
    for (final movie in movies) {
      await _db
          .into(_db.movieTables)
          .insertOnConflictUpdate(movie.toInsertable());
    }
  }
Future<void> saveMovie(final List<Movie> favoriteMovies) async{
    for (final movie in favoriteMovies) {
      await _db
          .into(_db.movieTables)
          .insertOnConflictUpdate(movie.toInsertable());
    }
}

}
