import 'package:drift/drift.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';

@UseRowClass(FavoriteMovie, generateInsertable: true)
class FavoriteMoviesTable extends Table {
  IntColumn get id => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
