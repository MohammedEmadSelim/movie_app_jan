import 'package:movies_station_app/core/errors/api_error.dart';
import 'package:movies_station_app/core/errors/failure.dart';
import 'package:movies_station_app/data/movie_details/data_source/movie_details_remote_data_source.dart';
import 'package:movies_station_app/data/movie_details/model/cast_model.dart';
import 'package:movies_station_app/data/movie_details/model/review_model.dart';
import 'package:movies_station_app/domain/movie_details/entities/cast_entity.dart';
import 'package:movies_station_app/domain/movie_details/entities/movie_details_entity.dart';
import 'package:movies_station_app/domain/movie_details/entities/review_entity.dart';
import 'package:movies_station_app/domain/movie_details/repositories/movie_details_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MovieDetailsRepo)
class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetailsRemoteDataSource remoteDataSource;

  MovieDetailsRepoImpl(this.remoteDataSource);

  @override
  Future<List<ReviewEntity>> getMovieReviews(int movieId) async {
    try {
      final List<ReviewModel> models = await remoteDataSource.getMovieReviews(
        movieId,
      );

      return models.map((e) => e.toEntity()).toList();
    } on ApiError catch (e) {
      throw ServerFailure(e.message);
    }
  }

  @override
  Future<List<CastEntity>> getMovieCast(int movieId) async {
    try {
      final model = await remoteDataSource.getMovieCast(movieId);

      return model.cast?.map((cast) => cast.toEntity()).toList() ?? [];
    } on ApiError catch (e) {
      throw ServerFailure(e.message);
    }
  }

  @override
  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    try {
      final model = await remoteDataSource.getMovieDetails(movieId);

      return model.toEntity();
    } on ApiError catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
