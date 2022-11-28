import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/favorite/data/favorite_movie_repository.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/data/movie_repository.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/movie/domain/movie.dart';

part 'movie_details_view_model.g.dart';

@injectable
class MovieDetailsViewModel extends MovieDetailsViewModelBase
    with _$MovieDetailsViewModel {
  MovieDetailsViewModel(final MovieRepository repository,
      final FavoriteMovieRepository favoriteRepo, @factoryParam int movieId)
      : super(repository, favoriteRepo, movieId);
}

abstract class MovieDetailsViewModelBase with Store {
  final MovieRepository repository;
  final int movieId;
  final FavoriteMovieRepository favoriteRepo;
  MovieDetailsViewModelBase(this.repository, this.favoriteRepo, this.movieId) {
    _getMovieDetails(movieId);
  }
  @observable
  Resource<Movie> movieDetails = Resource.initial();
  // add togglefavorite simple add/remove
  late ObservableStream<bool> isFavouriteObs =
      favoriteRepo.isFavorite(movieId).asObservable();

  @computed
  bool get isFavourite => isFavouriteObs.value ?? false;

  Future<void> toggleFavourites() async {
    if (isFavourite) {
      await favoriteRepo.removeFavourite(movieId);
    } else {
      await favoriteRepo
        ..addMovieToFavorite(movieId);
    }
  }

  Future<void> _getMovieDetails(int id) async {
    movieDetails = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      movieDetails =
          Resource.success(data: (await repository.getMovieDetails(id)));
    } catch (ex) {
      movieDetails = Resource.error(error: ex.toString());
    }
  }

  Future<void> addMovieToFavorite() async {
    if (movieDetails is! ResourceSuccess) {
      return;
    }
    final movie = movieDetails.data!;
    return repository.addMovieToFavorite(movie);
  }

  Stream<List<FavoriteMovie>> favoriteMovieStrem() {
    return repository.allFavoriteMovies();
  }

  Future<void> removeMovieFromFavorite(int id) async {}
}
