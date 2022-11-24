import 'package:drift/drift.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';

@UseRowClass(FavoriteMovie, generateInsertable: true)
class FavoriteMoviesTable extends Table {
  TextColumn get title => text()();
  TextColumn get originalTitle => text()();
  TextColumn get posterPath => text()();
  TextColumn get overview => text()();
  TextColumn get backdropPath => text()();
  IntColumn get id => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
