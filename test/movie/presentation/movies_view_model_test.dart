import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/movie/domain/movie.dart';

import 'package:movie_app/movie/presentation/widgets/movie_model.dart';
import 'package:movie_app/movie/presentation/widgets/movies_view_model.dart';

import '../../core/di.injection.dart';
import '../../popular_movie_utils.dart';
import '../../utils/test_mobx.dart';

void main() {
  //final List<MovieModel> = [Movie(id: id, backdropPath: backdropPath, originalTitle: originalTitle, posterPath: posterPath, title: title, overview: overview)]

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });
  setUp(() async {
    await configureInjectionTestDependencies();
  });
  tearDown(() async {
    await getIt.reset();
  });
  test('fake movie list exists', () async {
    final viewModel = getIt<MoviesViewModel>();
    expect(viewModel.allMovies, isA<ResourceLoading>());

    Resource<List<MovieModel>> actualSuccessResource =
        await asyncValue((_) => viewModel.allMovies);
    expect(actualSuccessResource, isA<ResourceSuccess<List<MovieModel>>>());
    expect(actualSuccessResource.data!.length, 0);

    actualSuccessResource = await asyncValue((_) => viewModel.allMovies);
    expect(actualSuccessResource, isA<ResourceSuccess<List<MovieModel>>>());
    expect(
        actualSuccessResource.data, PopularMovieUtils.happyPopularMovieModel);
  });

  // late MoviesViewModel viewModel;
  // MovieRepository movieRepository;
  // FavoriteMovieRepository favoriteMovieRepository;
  // FakeFavoriteMovieDao favoriteMovieDao;
  // FakeMovieDao movieDao;
  // FakeMoviesApi moviesApi;
  // Future<void> viewmModelSetup() async {
  //   MovieDao movieRealDao = MovieDao(AppDatabase(LazyDatabase(() async {
  //     return NativeDatabase.memory();
  //   })));
  //   moviesApi = FakeMoviesApi();
  //   movieDao = FakeMovieDao();
  //   favoriteMovieDao = FakeFavoriteMovieDao();
  //   favoriteMovieRepository =
  //       FavoriteMovieRepository(favoriteMovieDao, movieDao);
  //   movieRepository = MovieRepository(moviesApi, movieDao);
  //   viewModel = MoviesViewModel(movieRepository, favoriteMovieRepository);

  //   expect(viewModel.allMovies, isA<ResourceLoading>());
  // }

  // ;

  // test('try', () async {
  //   await viewmModelSetup();
  //   Resource<List<MovieModel>> actualSuccessResource =
  //       await asyncValue((_) => viewModel.allMovies);

  //   expect(actualSuccessResource, isA<ResourceSuccess<List<MovieModel>>>());

  //   expect(actualSuccessResource.data!.length, 20);
  // });
}
