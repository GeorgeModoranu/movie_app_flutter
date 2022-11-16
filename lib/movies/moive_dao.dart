import 'package:analyzer/dart/element/type.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movies/movie.dart';
import 'package:movie_app/storage/app_database.dart';
import 'package:movie_app/storage/storage_module.dart';
export 'package:movie_app/movies/movie_tables.dart';

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
}
