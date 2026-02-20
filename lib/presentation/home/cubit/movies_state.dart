import 'package:movies_station_app/domain/movies/entities/movie_entity.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<MovieEntity> nowPlaying;
  final List<MovieEntity> upcoming;
  final List<MovieEntity> topRated;
  final List<MovieEntity> popular;

  MoviesLoaded({
    required this.nowPlaying,
    required this.upcoming,
    required this.topRated,
    required this.popular,
  });
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);
}
