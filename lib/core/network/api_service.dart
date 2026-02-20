import 'package:dio/dio.dart';
import 'package:movies_station_app/core/network/dio_client.dart';
import 'package:movies_station_app/core/errors/api_error.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ApiService {
  final Dio _dio;

  ApiService(DioClient dioClient) : _dio = dioClient.dio;

  Future<dynamic> get(
    String endPoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.get(endPoint, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e) {
      throw ApiError(
        message: e.message ?? 'Unexpected error',
        statusCode: e.response?.statusCode,
      );
    }
  }

  Future<dynamic> post(String endPoint, dynamic body) async {
    try {
      final response = await _dio.post(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      throw ApiError(
        message: e.message ?? 'Unexpected error',
        statusCode: e.response?.statusCode,
      );
    }
  }

  Future<dynamic> put(String endPoint, dynamic body) async {
    try {
      final response = await _dio.put(endPoint, data: body);
      return response.data;
    } on DioException catch (e) {
      throw ApiError(
        message: e.message ?? 'Unexpected error',
        statusCode: e.response?.statusCode,
      );
    }
  }

  Future<dynamic> delete(
    String endPoint, {
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.delete(
        endPoint,
        data: body,
        queryParameters: queryParams,
      );
      return response.data;
    } on DioException catch (e) {
      throw ApiError(
        message: e.message ?? 'Unexpected error',
        statusCode: e.response?.statusCode,
      );
    }
  }
}
