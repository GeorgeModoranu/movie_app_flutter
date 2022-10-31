import 'package:movie_app/networking/networking.dart';
import 'package:movie_app/movies/movie.dart';

import '../date/genre_movie_response.dart';
class MoviesApi {
  final NetworkModule networkModule = NetworkModule();
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/popular', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/top_rated', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/now_playing', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }
  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/upcoming', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }
}