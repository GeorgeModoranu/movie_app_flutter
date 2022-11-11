import 'package:drift/drift.dart';
import 'package:movie_app/movies/movie.dart';

@UseRowClass(Movie, generateInsertable: true)
class MovieTables extends Table {
  TextColumn get title => text()();
  TextColumn get originalTitle => text()();
  TextColumn get posterPath => text()();
  TextColumn get overview => text()();
  TextColumn get backdropPath => text()();
  IntColumn get id => integer().autoIncrement()();
}
