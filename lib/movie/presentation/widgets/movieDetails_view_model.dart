import 'dart:ffi';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/movie/data/movie_repository.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/movie/domain/movie.dart';

part 'movieDetails_view_model.g.dart';

@injectable
class MovieDetailsViewModel extends MovieDetailsViewModelBase
    with _$MovieDetailsViewModel {
  MovieDetailsViewModel(
      final MovieRepository repository, @factoryParam int movieId)
      : super(repository, movieId);
}

abstract class MovieDetailsViewModelBase with Store {
  final MovieRepository repository;
  final int movieId;
  MovieDetailsViewModelBase(this.repository, this.movieId) {
    _getMovieDetails(movieId);
  }

  @observable
  Resource<Movie> movieDetails = Resource.initial();

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
}
