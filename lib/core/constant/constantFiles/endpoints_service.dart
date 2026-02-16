import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/constantFiles/api_query.dart';
import 'package:movie_app/core/constant/constantFiles/dio_helpers.dart';
import 'package:movie_app/core/constant/constantFiles/strings.dart';

class EndpointsService {
  //? endpoint for discover movies from api
  //! int page = 1 ==> make the initial page = 1 , if the user dosen't change it
  static Future<Response> getDiscoverEndPoint({int page = 1}) {
    return DioHelper.getData(
      endpoint: Strings.discoverEndPoint,
      query: ApiQuery.discoverQuery,
    );
  }

  //? endpoint for popular movies from api

  static Future<Response> geyPopularEndpoint({int page = 1}) {
    return DioHelper.getData(
      endpoint: Strings.popularEndpoint,
      query: ApiQuery.popularQuery,
    );
  }

  //? endpoint for topRated movies from api

  static Future<Response> getTopRatedEndPoint({int page = 1}) {
    return DioHelper.getData(
      endpoint: Strings.topRatedEndpoint,
      query: ApiQuery.topRatedQuery,
    );
  }   

  //? endpoint for UpComing movies from api

  static Future<Response> getUpcomingEndPoint({int page = 1}) {
    return DioHelper.getData(
      endpoint: Strings.upComingEndpoint,
      query: ApiQuery.upComingQuery,
    );
  }
}
