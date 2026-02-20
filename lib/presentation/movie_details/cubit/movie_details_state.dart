import 'package:movies_station_app/domain/movie_details/entities/movie_details_entity.dart';
import 'package:movies_station_app/domain/movie_details/entities/review_entity.dart';
import 'package:movies_station_app/domain/movie_details/entities/cast_entity.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final List<ReviewEntity> reviews;
  final List<CastEntity> cast;
  final MovieDetailsEntity movieDetails;

  MovieDetailsLoaded({
    required this.reviews,
    required this.cast,
    required this.movieDetails,
  });
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError(this.message);
}
