import 'package:movies_station_app/core/network/api_service.dart';
import 'package:movies_station_app/data/movies/data_source/movie_remote_data_source.dart';
import 'package:movies_station_app/data/movies/model/movie_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MoviesRemoteDataSource)
class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final ApiService apiService;

  MoviesRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await apiService.get(
      'movie/top_rated',
      queryParams: {'language': 'en-US', 'page': 1},
    );

    final List results = response['results'];

    return results.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await apiService.get(
      'movie/popular',
      queryParams: {'language': 'en-US', 'page': 1},
    );

    final List results = response['results'];

    return results.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await apiService.get(
      'movie/upcoming',
      queryParams: {'language': 'en-US', 'page': 1},
    );

    final List results = response['results'];

    return results.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await apiService.get(
      'movie/now_playing',
      queryParams: {'language': 'en-US', 'page': 1},
    );

    final List results = response['results'];

    return results.map((json) => MovieModel.fromJson(json)).toList();
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await apiService.get(
      'search/movie',
      queryParams: {'language': 'en-US', 'page': 1, 'query': query},
    );

    final List results = response['results'];
    print(response);

    return results.map((json) => MovieModel.fromJson(json)).toList();
  }
}
