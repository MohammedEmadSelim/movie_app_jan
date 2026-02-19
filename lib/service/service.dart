import 'package:dio/dio.dart';
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
    final res = await dio.get(ApiConstants.popular);

    List results = res.data['results'];

    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

}