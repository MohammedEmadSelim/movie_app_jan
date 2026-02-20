import 'package:movies_station_app/data/movie_details/model/cast_model.dart';
import 'package:movies_station_app/data/movie_details/model/movie_details_model.dart';
import 'package:movies_station_app/data/movie_details/model/review_model.dart';

abstract class MovieDetailsRemoteDataSource {
  Future<List<ReviewModel>> getMovieReviews(int movieId);
  Future<CastModel> getMovieCast(int movieId);
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}
