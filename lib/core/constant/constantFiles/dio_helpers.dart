import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/constantFiles/strings.dart';

class DioHelper {
  static late Dio dio;

  //! Dio Function
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: Strings.baseUrl,
        //! make dio receive the response data until there are error .
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxYmYwNzRjYzk3MzE0YmRiMWZmM2VlMmQ3NWUwNWY0ZiIsIm5iZiI6MTc2MTM5NzAxOS4xMDgsInN1YiI6IjY4ZmNjOTFiYzQzZDA1OTllMjkzODUwNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lzdT9GXoMtzophhJo7yb5wZ0MviXwdxUh7Lo1kVT1N4",
          "accept": "application/json",
        },
      ),
    );
  }

  //! Get Data From API to each endpoint.

  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(endpoint, queryParameters: query);
  }
}
