import 'dart:convert';

import 'package:dio/src/dio.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/movie/data/genre_movie_response.dart';
import 'package:movie_app/movie/data/movie_api.dart';
import 'package:movie_app/movie/domain/movie.dart';

class FakeMoviesApi implements MoviesApi {
  //final bool shouldThrowError;
  //FakeMoviesApi(this.shouldThrowError);

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final respone = await rootBundle.loadString('assets/popularMovies.json');
    final data = await json.decode(respone);
    //return Future.error("error");
    return GenreMovieResponse.fromJson(data).toDomainList();
  }

  @override
  Future<Movie> getMovieDetails(int movieId) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

//schimb
  @override
  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    final respone = await rootBundle.loadString('assets/popularMovies.json');
    final data = await json.decode(respone);
    return GenreMovieResponse.fromJson(data).toDomainList();
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  // TODO: implement dio
  Dio get dio => throw UnimplementedError();
}
