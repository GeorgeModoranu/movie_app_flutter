// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MovieTableCompanion extends UpdateCompanion<Movie> {
  final Value<String> title;
  final Value<String> originalTitle;
  final Value<String> posterPath;
  final Value<String> overview;
  final Value<String> backdropPath;
  final Value<int> id;
  const MovieTableCompanion({
    this.title = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.overview = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.id = const Value.absent(),
  });
  MovieTableCompanion.insert({
    required String title,
    required String originalTitle,
    required String posterPath,
    required String overview,
    required String backdropPath,
    this.id = const Value.absent(),
  })  : title = Value(title),
        originalTitle = Value(originalTitle),
        posterPath = Value(posterPath),
        overview = Value(overview),
        backdropPath = Value(backdropPath);
  static Insertable<Movie> custom({
    Expression<String>? title,
    Expression<String>? originalTitle,
    Expression<String>? posterPath,
    Expression<String>? overview,
    Expression<String>? backdropPath,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (originalTitle != null) 'original_title': originalTitle,
      if (posterPath != null) 'poster_path': posterPath,
      if (overview != null) 'overview': overview,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (id != null) 'id': id,
    });
  }

  MovieTableCompanion copyWith(
      {Value<String>? title,
      Value<String>? originalTitle,
      Value<String>? posterPath,
      Value<String>? overview,
      Value<String>? backdropPath,
      Value<int>? id}) {
    return MovieTableCompanion(
      title: title ?? this.title,
      originalTitle: originalTitle ?? this.originalTitle,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
      backdropPath: backdropPath ?? this.backdropPath,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieTableCompanion(')
          ..write('title: $title, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('posterPath: $posterPath, ')
          ..write('overview: $overview, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class _$MovieInsertable implements Insertable<Movie> {
  Movie _object;

  _$MovieInsertable(this._object);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return MovieTableCompanion(
      id: Value(_object.id),
      backdropPath: Value(_object.backdropPath),
      originalTitle: Value(_object.originalTitle),
      posterPath: Value(_object.posterPath),
      title: Value(_object.title),
      overview: Value(_object.overview),
    ).toColumns(false);
  }
}

extension MovieToInsertable on Movie {
  _$MovieInsertable toInsertable() {
    return _$MovieInsertable(this);
  }
}

class $MovieTableTable extends MovieTable
    with TableInfo<$MovieTableTable, Movie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  @override
  List<GeneratedColumn> get $columns =>
      [title, originalTitle, posterPath, overview, backdropPath, id];
  @override
  String get aliasedName => _alias ?? 'movie_table';
  @override
  String get actualTableName => 'movie_table';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    } else if (isInserting) {
      context.missing(_originalTitleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Movie(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      backdropPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path'])!,
      originalTitle: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}original_title'])!,
      posterPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
    );
  }

  @override
  $MovieTableTable createAlias(String alias) {
    return $MovieTableTable(attachedDatabase, alias);
  }
}

class FavoriteMoviesTableCompanion extends UpdateCompanion<FavoriteMovie> {
  final Value<int> id;
  const FavoriteMoviesTableCompanion({
    this.id = const Value.absent(),
  });
  FavoriteMoviesTableCompanion.insert({
    this.id = const Value.absent(),
  });
  static Insertable<FavoriteMovie> custom({
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
    });
  }

  FavoriteMoviesTableCompanion copyWith({Value<int>? id}) {
    return FavoriteMoviesTableCompanion(
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteMoviesTableCompanion(')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

class _$FavoriteMovieInsertable implements Insertable<FavoriteMovie> {
  FavoriteMovie _object;

  _$FavoriteMovieInsertable(this._object);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return FavoriteMoviesTableCompanion(
      id: Value(_object.id),
    ).toColumns(false);
  }
}

extension FavoriteMovieToInsertable on FavoriteMovie {
  _$FavoriteMovieInsertable toInsertable() {
    return _$FavoriteMovieInsertable(this);
  }
}

class $FavoriteMoviesTableTable extends FavoriteMoviesTable
    with TableInfo<$FavoriteMoviesTableTable, FavoriteMovie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteMoviesTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id];
  @override
  String get aliasedName => _alias ?? 'favorite_movies_table';
  @override
  String get actualTableName => 'favorite_movies_table';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteMovie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteMovie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteMovie(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $FavoriteMoviesTableTable createAlias(String alias) {
    return $FavoriteMoviesTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MovieTableTable movieTable = $MovieTableTable(this);
  late final $FavoriteMoviesTableTable favoriteMoviesTable =
      $FavoriteMoviesTableTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [movieTable, favoriteMoviesTable];
}
