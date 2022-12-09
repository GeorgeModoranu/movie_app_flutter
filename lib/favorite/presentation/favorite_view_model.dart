import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/favorite/data/favorite_movie_repository.dart';
import 'package:movie_app/favorite/domain/favorite_movie.dart';
import 'package:movie_app/movie/data/movie_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/movie/domain/movie.dart';

part 'favorite_view_model.g.dart';

@injectable
class FavoritesViewModel extends FavoriteViewModelBase
    with _$FavoritesViewModel {
  FavoritesViewModel(final FavoriteMovieRepository favoriteRepo)
      : super(favoriteRepo);
}

abstract class FavoriteViewModelBase with Store {
  final FavoriteMovieRepository favoriteRepo;
  FavoriteViewModelBase(this.favoriteRepo) {
    favoriteMovieStrem();
  }
  Stream<List<FavoriteMovie>> favoriteMovieStrem() {
    return favoriteRepo.allFavoriteMovies();
  }

  Future<void> removeFavoriteMovie(int movieId) async {
    await favoriteRepo.removeFavourite(movieId);
  }

  Future<List<Movie>> getAllFavoriteMovies() {
    return favoriteRepo.getFavoriteMovies();
  }
}
