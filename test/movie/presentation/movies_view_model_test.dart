import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/core/storage/app_database.dart';
import 'package:movie_app/favorite/data/favorite_movie_repository.dart';
import 'package:movie_app/movie/data/moive_dao.dart';
import 'package:movie_app/movie/data/movie_api.dart';
import 'package:movie_app/movie/data/movie_repository.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:movie_app/movie/presentation/widgets/movie_model.dart';
import 'package:movie_app/movie/presentation/widgets/movie_section_widget.dart';
import 'package:movie_app/movie/presentation/widgets/movies_view_model.dart';
import 'package:networking/networking.dart';

import '../../common.dart';
import '../../favorite/fake_favorite_movie_dao.dart';
import '../data/fake_movie_api.dart';
import '../data/fake_movie_dao.dart';
import 'package:json_annotation/json_annotation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late MoviesViewModel viewModel;
  MovieRepository movieRepository;
  FavoriteMovieRepository favoriteMovieRepository;
  FakeFavoriteMovieDao favoriteMovieDao;
  FakeMovieDao movieDao;
  FakeMoviesApi moviesApi;
  Future<void> viewmModelSetup() async {
    MovieDao movieRealDao = MovieDao(AppDatabase(LazyDatabase(() async {
      return NativeDatabase.memory();
    })));
    moviesApi = FakeMoviesApi();
    movieDao = FakeMovieDao();
    favoriteMovieDao = FakeFavoriteMovieDao();
    favoriteMovieRepository =
        FavoriteMovieRepository(favoriteMovieDao, movieDao);
    movieRepository = MovieRepository(moviesApi, movieDao);
    viewModel = MoviesViewModel(movieRepository, favoriteMovieRepository);

    expect(viewModel.allMovies, isA<ResourceLoading>());
  }

  ;

  test('try', () async {
    await viewmModelSetup();
    Resource<List<MovieModel>> actualSuccessResource =
        await asyncValue((_) => viewModel.allMovies);

    expect(actualSuccessResource, isA<ResourceSuccess<List<MovieModel>>>());

    expect(actualSuccessResource.data!.length, 20);
  });
}
