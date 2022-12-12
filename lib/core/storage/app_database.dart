import 'dart:io';
import 'package:drift/native.dart';
import 'package:movie_app/favorite/data/favorite_movie_tabel.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:movie_app/movie/data/movie_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [MovieTable, FavoriteMoviesTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;
  // @override
  // MigrationStrategy get migrator
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
