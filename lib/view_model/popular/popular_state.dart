part of 'popular_cubit.dart';

@immutable
sealed class PopularState {}

final class PopularInitial extends PopularState {}

final class PopularMovieLoading extends PopularState {}

final class PopularMovieSuccess extends PopularState {
  final PopularMovieModel popularMovie;
  PopularMovieSuccess(this.popularMovie);
}

final class PopularMovieError extends PopularState {
  final String message;
  PopularMovieError(this.message);
}
