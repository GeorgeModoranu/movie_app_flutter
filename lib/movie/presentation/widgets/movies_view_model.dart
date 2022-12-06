import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/favorite/data/favorite_movie_repository.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/presentation/widgets/movie_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/movie_repository.dart';
import '../../domain/movie.dart';
import 'package:collection/collection.dart';

part 'movies_view_model.g.dart';

@injectable
class MoviesViewModel extends MoviesViewModelBase with _$MoviesViewModel {
  MoviesViewModel(final MovieRepository movieRepo,
      final FavoriteMovieRepository favoriteRepo)
      : super(movieRepo, favoriteRepo);
}

//computed resourse view model
abstract class MoviesViewModelBase with Store {
  final MovieRepository movieRepo;
  final FavoriteMovieRepository favoriteRepo;
  MoviesViewModelBase(this.movieRepo, this.favoriteRepo) {
    getMovies();
    getMoviesRated();
    getNowPlayingMovies();
    getOutInCinema();
  }

  @computed
  bool get isLoading =>
      popularMovies is ResourceLoading ||
      topRatedMovies is ResourceLoading ||
      nowPlayingMovies is ResourceLoading ||
      outInCinema is ResourceLoading;

  @computed
  String? get loadingError =>
      popularMovies.mapOrNull(error: (value) => value.error) ??
      topRatedMovies.mapOrNull(error: (value) => value.error) ??
      nowPlayingMovies.mapOrNull(error: (value) => value.error) ??
      outInCinema.mapOrNull(error: (value) => value.error);

  @observable
  Resource<List<Movie>> popularMovies = Resource.initial();
  @observable
  Resource<List<Movie>> topRatedMovies = Resource.initial();
  @observable
  Resource<List<Movie>> nowPlayingMovies = Resource.initial();
  @observable
  Resource<List<Movie>> outInCinema = Resource.initial();

  Future<void> getMovies({final int page = 1}) async {
    popularMovies = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));

      movieRepo.loadMovies();
    } catch (ex) {
      popularMovies = Resource.error(error: ex.toString());
    }
  }

  late ObservableStream<List<Movie>> moviesObs =
      movieRepo.allMovies().asObservable();
  late ObservableStream<Set<int>> favoriteMovieObs =
      favoriteRepo.allFavoriteMovies().asObservable();

  @computed
  Resource<List<MovieModel>> get allMovies {
    final movies = moviesObs.value;
    final favorite = favoriteMovieObs.value;
    if (movies == null || favorite == null) {
      return Resource.loading();
    }
    return Resource.success(
        data: movies.map((movie) {
      final bool favoriteMovie = favorite.contains(movie.id);
      return MovieModel(movie, favoriteMovie);
    }).toList());
  }

  Future<void> toggleFavorite(int movieId, bool favorite) async {
    if (favorite) {
       await favoriteRepo.addMovieToFavorite(movieId);
    } else {
       await favoriteRepo.removeFavourite(movieId);
    }
  }
  // Stream<List<MovieModel>> allMovieModels() {
  //   return Rx.combineLatest2(
  //       movieRepo.allMovies(),
  //       favoriteRepo.allFavoriteMovies(),
  //       (movieList, favoriteList) => movieList.map((movie) {
  //             final bool favoriteMovie = favoriteList.contains(movie.id);
  //             return MovieModel(movie, favoriteMovie);
  //           }).toList());
  // }

  Stream<List<Movie>> movieStream() {
    return movieRepo.allMovies();
  }

  Future<void> getMoviesRated({final int page = 1}) async {
    topRatedMovies = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      topRatedMovies = Resource.success(
          data: (await movieRepo.getTopRatedMovies()).asObservable());
    } catch (ex) {
      topRatedMovies = Resource.error(error: ex.toString());
    }
  }

  Future<void> getNowPlayingMovies({final int page = 1}) async {
    nowPlayingMovies = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      nowPlayingMovies = Resource.success(
          data: (await movieRepo.getNowPlayingMovies()).asObservable());
    } catch (ex) {
      nowPlayingMovies = Resource.error(error: ex.toString());
    }
  }

  Future<void> getOutInCinema({final int page = 1}) async {
    outInCinema = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      outInCinema = Resource.success(
          data: (await movieRepo.getOutInCinema()).asObservable());
    } catch (ex) {
      outInCinema = Resource.error(error: ex.toString());
    }
  }
}
