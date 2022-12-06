import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/data/genre_movie_response.dart';
import 'package:movie_app/movie/domain/movie.dart';

@Injectable(as: IMoviesApi)
@lazySingleton
class MoviesApi extends IMoviesApi {
  final Dio dio;
  MoviesApi(this.dio);
  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  @override
  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  @override
  Future<Movie> getMovieDetails(int movieId) async {
    final response = await dio.get('/movie/${movieId}');
    return MovieResponse.fromJson(response.data).toDomain();
  }
}

abstract class IMoviesApi {
  Future<List<Movie>> getPopularMovies({int page = 1});
  Future<List<Movie>> getTopRatedMovies({int page = 1});
  Future<List<Movie>> getNowPlayingMovies({int page = 1});
  Future<List<Movie>> getOutInCinema({int page = 1});
  Future<Movie> getMovieDetails(int movieId);
}
