import 'package:dio/dio.dart';
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
  Future<Response> getPopularMovies() async{
    return await dio.get(ApiConstants.popular);

  }
}