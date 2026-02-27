import 'package:dio/dio.dart';
import '../models/cast_model.dart';
import '../models/movie_model.dart';
import 'ApiKeys.dart';
import 'api_constants.dart';


class Service {
  late Dio dio;

  Service(){
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {
          "Authorization": "Bearer ${ApiKeys.token}",
          "accept": "application/json",


        }

      )
    );
  }
  Future<List<MovieModel>> getPopularMovies() async {
    final res = await dio.get(
      ApiConstants.popular,
      queryParameters: {'api_key': ApiKeys.token},
    );
    List results = res.data['results'];

    return results.map((e) => MovieModel.fromJson(e)).toList();
  }
  Future<List<MovieModel>> searchMovies(String query) async {
    final res = await dio.get(
      ApiConstants.search,
      queryParameters: {
        'api_key': ApiKeys.token,
        'query': query,
      },
    );
    List results = res.data['results'];
    return results.map((e) => MovieModel.fromJson(e)).toList();



  }
  Future<List<MovieModel>> getMovies(String type) async {
    final res = await dio.get(
      type,
      queryParameters: {'api_key': ApiKeys.token},
    );
    List results = res.data['results'];
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }
  Future<List<CastModel>> getCast(int id) async {
    final res = await dio.get(
      "${ApiConstants.movie}/$id/credits",
      queryParameters: {'api_key': ApiKeys.token},
    );
    List results = res.data['cast'];
    return results.map((e) => CastModel.fromJson(e)).toList();
}
  Future<List<dynamic>> getReviews(int id) async {
    final res = await dio.get(
      ApiConstants.movieReviews(id),
      queryParameters: {'api_key': ApiKeys.token},
    );
    return res.data['results'];
  }

}