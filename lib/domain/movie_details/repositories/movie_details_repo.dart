import 'package:movies_station_app/domain/movie_details/entities/cast_entity.dart';
import 'package:movies_station_app/domain/movie_details/entities/movie_details_entity.dart';
import 'package:movies_station_app/domain/movie_details/entities/review_entity.dart';

abstract class MovieDetailsRepo {
  Future<List<ReviewEntity>> getMovieReviews(int movieId);
  Future<List<CastEntity>> getMovieCast(int movieId);
  Future<MovieDetailsEntity> getMovieDetails(int movieId);
}
