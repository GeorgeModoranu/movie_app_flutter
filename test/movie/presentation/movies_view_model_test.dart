import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:movie_app/core/di.iconfig.dart';
import 'package:movie_app/core/resource.dart';
import '../../../lib/movie/data/fake_movie_api.dart';
import 'package:movie_app/movie/data/movie_api.dart';
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
    expect(viewModel.allMovies, isA<ResourceInitial>());
    expect(
        await asyncValue((_) => viewModel.allMovies), isA<ResourceLoading>());
    expect(
        await asyncValue((_) => viewModel.allMovies),
        Resource<List<MovieModel>>.success(data: [
          MovieModel(
              movie: Movie(
                backdropPath:
                    "https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
                id: 436270,
                originalTitle: "Black Adam",
                overview:
                    "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
                posterPath:
                    "https://image.tmdb.org/t/p/original/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
                title: "Black Adam",
              ),
              isFavorite: false),
        ]));
  });
  test('movie list failed', () async {
    final fakeApi = getIt<MoviesApi>() as FakeMoviesApi;
    fakeApi.exception = Exception('Exception try');
    final viewModel = getIt<MoviesViewModel>();
    expect(viewModel.allMovies, isA<ResourceInitial>());
    expect(
        await asyncValue((_) => viewModel.allMovies), isA<ResourceLoading>());
    expect(await asyncValue((_) => viewModel.allMovies),
        Resource.error(error: fakeApi.exception.toString()));
  });
  test('add movie to favorite', () async {
    final viewModel = getIt<MoviesViewModel>();
    viewModel.toggleFavorite(436270, true);
    expect(viewModel.allMovies, isA<ResourceInitial>());
    expect(
        await asyncValue((_) => viewModel.allMovies), isA<ResourceLoading>());
         expect(
        await asyncValue((_) => viewModel.allMovies),
        Resource<List<MovieModel>>.success(data: [
          MovieModel(
              movie: Movie(
                backdropPath:
                    "https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
                id: 436270,
                originalTitle: "Black Adam",
                overview:
                    "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
                posterPath:
                    "https://image.tmdb.org/t/p/original/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
                title: "Black Adam",
              ),
              isFavorite: true),
        ]));
  });
   test('remove movie to favorite', () async {
    final viewModel = getIt<MoviesViewModel>();
    viewModel.toggleFavorite(436270, false);
    expect(viewModel.allMovies, isA<ResourceInitial>());
    expect(
        await asyncValue((_) => viewModel.allMovies), isA<ResourceLoading>());
         expect(
        await asyncValue((_) => viewModel.allMovies),
        Resource<List<MovieModel>>.success(data: [
          MovieModel(
              movie: Movie(
                backdropPath:
                    "https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
                id: 436270,
                originalTitle: "Black Adam",
                overview:
                    "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
                posterPath:
                    "https://image.tmdb.org/t/p/original/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
                title: "Black Adam",
              ),
              isFavorite: false),
        ]));
  });
  
  // Resource<List<MovieModel>> actualSuccessResource =
  //     await asyncValue((_) => viewModel.allMovies);
  // expect(actualSuccessResource, isA<ResourceSuccess<List<MovieModel>>>());
  // expect(actualSuccessResource.data!.length, 0);

  // actualSuccessResource = await asyncValue((_) => viewModel.allMovies);
  // expect(actualSuccessResource, isA<ResourceSuccess<List<MovieModel>>>());
  // expect(
  //     actualSuccessResource.data, PopularMovieUtils.happyPopularMovieModel);

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
