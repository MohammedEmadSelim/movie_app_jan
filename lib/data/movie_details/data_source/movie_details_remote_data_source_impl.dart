import 'package:movies_station_app/core/network/api_service.dart';
import 'package:movies_station_app/data/movie_details/data_source/movie_details_remote_data_source.dart';
import 'package:movies_station_app/data/movie_details/model/cast_model.dart';
import 'package:movies_station_app/data/movie_details/model/movie_details_model.dart';
import 'package:movies_station_app/data/movie_details/model/review_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieDetailsRemoteDataSource)
class MovieDetailsRemoteDataSourceImpl implements MovieDetailsRemoteDataSource {
  final ApiService apiService;

  MovieDetailsRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<ReviewModel>> getMovieReviews(int movieId) async {
    final response = await apiService.get(
      'movie/$movieId/reviews',
      queryParams: {'language': 'en-US', 'page': 1},
    );

    final List results = response['results'];

    return results.map((json) => ReviewModel.fromJson(json)).toList();
  }

  @override
  Future<CastModel> getMovieCast(int movieId) async {
    final response = await apiService.get(
      'movie/$movieId/credits',
      queryParams: {'language': 'en-US'},
    );

    return CastModel.fromJson(response);
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    final response = await apiService.get(
      'movie/$movieId',
      queryParams: {'language': 'en-US'},
    );

    return MovieDetailsModel.fromJson(response);
  }
}
