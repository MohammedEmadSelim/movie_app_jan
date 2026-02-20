import 'package:movies_station_app/core/errors/api_error.dart';
import 'package:movies_station_app/core/errors/failure.dart';
import 'package:movies_station_app/data/movies/data_source/movie_remote_data_source.dart';
import 'package:movies_station_app/data/movies/model/movie_model.dart';
import 'package:movies_station_app/domain/movies/entities/movie_entity.dart';
import 'package:movies_station_app/domain/movies/repositories/movies_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MoviesRepo)
class MoviesRepoImpl implements MoviesRepo {
  final MoviesRemoteDataSource remoteDataSource;

  MoviesRepoImpl(this.remoteDataSource);

  @override
  Future<List<MovieEntity>> getTopRatedMovies() async {
    try {
      final List<MovieModel> models = await remoteDataSource
          .getTopRatedMovies();

      return models.map((e) => e.toEntity()).toList();
    } on ApiError catch (e) {
      throw ServerFailure(e.message);
    }
  }

  @override
  Future<List<MovieEntity>> getPopularMovies() async {
    try {
      final models = await remoteDataSource.getPopularMovies();
      return models.map((e) => e.toEntity()).toList();
    } on ApiError catch (e) {
      throw ServerFailure(e.message);
    }
  }

  @override
  Future<List<MovieEntity>> getUpcomingMovies() async {
    try {
      final models = await remoteDataSource.getUpcomingMovies();
      return models.map((e) => e.toEntity()).toList();
    } on ApiError catch (e) {
      throw ServerFailure(e.message);
    }
  }

  @override
  Future<List<MovieEntity>> getNowPlayingMovies() async {
    try {
      final models = await remoteDataSource.getNowPlayingMovies();
      return models.map((e) => e.toEntity()).toList();
    } on ApiError catch (e) {
      throw ServerFailure(e.message);
    }
  }

  @override
  Future<List<MovieEntity>> searchMovies(String query) async {
    final models = await remoteDataSource.searchMovies(query);

    return models.map((model) => model.toEntity()).toList();
  }
}
