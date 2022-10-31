// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoriteMoviesStore on _FavoriteMoviesStore, Store {
  late final _$favoriteMoviesAtom =
      Atom(name: '_FavoriteMoviesStore.favoriteMovies', context: context);

  @override
  ObservableList<MovieModelMock> get favoriteMovies {
    _$favoriteMoviesAtom.reportRead();
    return super.favoriteMovies;
  }

  @override
  set favoriteMovies(ObservableList<MovieModelMock> value) {
    _$favoriteMoviesAtom.reportWrite(value, super.favoriteMovies, () {
      super.favoriteMovies = value;
    });
  }

  late final _$_FavoriteMoviesStoreActionController =
      ActionController(name: '_FavoriteMoviesStore', context: context);

  @override
  void add(MovieModelMock movie) {
    final _$actionInfo = _$_FavoriteMoviesStoreActionController.startAction(
        name: '_FavoriteMoviesStore.add');
    try {
      return super.add(movie);
    } finally {
      _$_FavoriteMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAll() {
    final _$actionInfo = _$_FavoriteMoviesStoreActionController.startAction(
        name: '_FavoriteMoviesStore.removeAll');
    try {
      return super.removeAll();
    } finally {
      _$_FavoriteMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(MovieModelMock movie) {
    final _$actionInfo = _$_FavoriteMoviesStoreActionController.startAction(
        name: '_FavoriteMoviesStore.remove');
    try {
      return super.remove(movie);
    } finally {
      _$_FavoriteMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteMovies: ${favoriteMovies}
    ''';
  }
}
