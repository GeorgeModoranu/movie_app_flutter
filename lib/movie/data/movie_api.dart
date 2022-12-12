import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/data/genre_movie_response.dart';
import 'package:movie_app/movie/domain/movie.dart';

@lazySingleton
@dev
class MoviesApi {
  final Dio _dio;
  MoviesApi(this._dio);

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    // throw Exception("sdfsdf");
    // return Future.error("asdas");
    try {
      final response =
          await _dio.get('/movie/popular', queryParameters: {'page': page});
      return GenreMovieResponse.fromJson(response.data).toDomainList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response =
        await _dio.get('/movie/top_rated', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response =
        await _dio.get('/movie/now_playing', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    final response =
        await _dio.get('/movie/upcoming', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  Future<Movie> getMovieDetails(int movieId) async {
    final response = await _dio.get('/movie/${movieId}');
    return MovieResponse.fromJson(response.data).toDomain();
  }
}
