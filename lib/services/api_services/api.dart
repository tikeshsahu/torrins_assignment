import 'package:flutter/foundation.dart';
import 'package:torrins_assignment/services/api_services/dio_config.dart';
import 'package:torrins_assignment/utils/app_constants.dart';

class Api {
  Api._();

  static final instance = Api._();

  final _dio = DioConfig.instance.getInstance();

  Future<List> getTrendingMovies() async {
    try {
      const url = '${AppConstants.baseUrl}/movie/now_playing?${AppConstants.apiKey}';
      final response = await _dio.get(url);
      var movies = response.data['results'] as List;
      return movies;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future getPopularMovies(int pageKey) async {
    try {
      final url = '${AppConstants.baseUrl}/movie/popular?${AppConstants.apiKey}&page=$pageKey';
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future getUpcomingMovies(int pageKey) async {
    try {
      final url = '${AppConstants.baseUrl}/movie/upcoming?${AppConstants.apiKey}&page=$pageKey';
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future getSimilarMovies(int movieId) async {
    try {
      final url = '${AppConstants.baseUrl}/movie/$movieId/similar?${AppConstants.apiKey}';
      final response = await _dio.get(url);
      var movies = response.data['results'];
      // List<Movie> movieList = movies.map((e) => Movie.fromJson(e)).toList();
      return movies;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  // get movie details
  Future getMovieDetails(int movieId) async {
    try {
      final url = '${AppConstants.baseUrl}/movie/$movieId?${AppConstants.apiKey}';
      final response = await _dio.get(url);
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  // get youtube id
  Future getYoutubeId(int movieId) async {
    try {
      final url = '${AppConstants.baseUrl}/movie/$movieId/videos?${AppConstants.apiKey}';
      final response = await _dio.get(url);
      return response.data['results'][0]['key'];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
