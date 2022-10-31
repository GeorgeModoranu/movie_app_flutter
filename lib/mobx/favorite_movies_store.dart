import 'package:mobx/mobx.dart';

import '../model/movie_model_mock.dart';

part 'favorite_movies_store.g.dart';

class FavoriteMoviesStore = _FavoriteMoviesStore with _$FavoriteMoviesStore;
abstract class _FavoriteMoviesStore with Store{
  @observable
  ObservableList<MovieModelMock> favoriteMovies =
  <MovieModelMock>[].asObservable();

  @action
  void add(MovieModelMock movie) {
    favoriteMovies.add(movie);
  }

  @action
  void removeAll() {
    favoriteMovies.clear();
  }

  @action
  void remove(MovieModelMock movie) {
    favoriteMovies.remove(movie);
  }
}