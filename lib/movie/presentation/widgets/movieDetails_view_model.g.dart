// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieDetails_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieDetailsViewModel on MovieDetailsViewModelBase, Store {
  late final _$movieDetailsAtom =
      Atom(name: 'MovieDetailsViewModelBase.movieDetails', context: context);

  @override
  Resource<Movie> get movieDetails {
    _$movieDetailsAtom.reportRead();
    return super.movieDetails;
  }

  @override
  set movieDetails(Resource<Movie> value) {
    _$movieDetailsAtom.reportWrite(value, super.movieDetails, () {
      super.movieDetails = value;
    });
  }

  @override
  String toString() {
    return '''
movieDetails: ${movieDetails}
    ''';
  }
}
