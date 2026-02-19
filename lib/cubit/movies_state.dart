part of 'movies_cubit.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesSuccess extends MoviesState {
  final List<MovieModel> moviesList;

  MoviesSuccess({required this.moviesList});
}

class MoviesError extends MoviesState {}


