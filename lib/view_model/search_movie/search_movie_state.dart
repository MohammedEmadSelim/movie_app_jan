part of 'search_movie_cubit.dart';

@immutable
sealed class SearchMovieState {}

final class SearchMovieInitial extends SearchMovieState {}

final class SearchMovieLoading extends SearchMovieState {}

final class SearchMovieSuccess extends SearchMovieState {
  final SearchMovieModel searchMovie;
  SearchMovieSuccess(this.searchMovie);
}

final class SearchMovieError extends SearchMovieState {
  final String message;
  SearchMovieError(this.message);
}
